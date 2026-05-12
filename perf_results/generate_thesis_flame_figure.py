#!/usr/bin/env python3

from __future__ import annotations

import argparse
import hashlib
import os
import re
import tempfile
import xml.etree.ElementTree as ET
from dataclasses import dataclass
from pathlib import Path
from typing import Iterable

os.environ.setdefault("MPLCONFIGDIR", os.path.join(tempfile.gettempdir(), "mpl-cache"))

import matplotlib

matplotlib.use("Agg")
import matplotlib.pyplot as plt
from matplotlib.patches import Rectangle
import numpy as np


SVG_NS = {"svg": "http://www.w3.org/2000/svg"}
TITLE_RE = re.compile(r"^(?P<name>.*) \((?P<permille>[\d,]+) permille, (?P<pct>[\d.]+)%\)$")
HEX_ONLY_RE = re.compile(r"^(0x)?[0-9a-fA-F]{8,}$")


@dataclass(frozen=True)
class Frame:
    name: str
    permille: int
    pct: float
    x: float
    y: float
    width: float
    height: float

    @property
    def right(self) -> float:
        return self.x + self.width


def parse_title(title: str) -> tuple[str, int, float]:
    match = TITLE_RE.match(title.strip())
    if not match:
        raise ValueError(f"Unexpected title format: {title!r}")
    return (
        match.group("name"),
        int(match.group("permille").replace(",", "")),
        float(match.group("pct")),
    )


def load_frames(svg_path: Path) -> list[Frame]:
    root = ET.parse(svg_path).getroot()
    frames_parent = root.find(".//svg:g[@id='frames']", SVG_NS)
    if frames_parent is None:
        raise ValueError(f"Could not find frames group in {svg_path}")

    frames: list[Frame] = []
    for group in frames_parent.findall("svg:g", SVG_NS):
        title_el = group.find("svg:title", SVG_NS)
        rect_el = group.find("svg:rect", SVG_NS)
        if title_el is None or rect_el is None or not title_el.text:
            continue
        name, permille, pct = parse_title(title_el.text)
        frames.append(
            Frame(
                name=name,
                permille=permille,
                pct=pct,
                x=float(rect_el.attrib["x"]),
                y=float(rect_el.attrib["y"]),
                width=float(rect_el.attrib["width"]),
                height=float(rect_el.attrib["height"]),
            )
        )
    if not frames:
        raise ValueError(f"No frames parsed from {svg_path}")
    return frames


def find_root(frames: list[Frame]) -> Frame:
    return max(frames, key=lambda frame: frame.width)


def find_primary_hotspot(frames: list[Frame]) -> Frame:
    root = find_root(frames)
    non_root = [frame for frame in frames if frame is not root]
    return max(non_root, key=lambda frame: (frame.width, -frame.y))


def crop_for_hotspot(frames: list[Frame], hotspot: Frame) -> tuple[float, float, float, float]:
    root = find_root(frames)
    x_pad = root.width * 0.03
    x_min = max(root.x, hotspot.x - x_pad)
    x_max = min(root.right, hotspot.right + x_pad)
    in_window = [frame for frame in frames if frame.right >= x_min and frame.x <= x_max]
    y_values = [frame.y for frame in in_window]
    return x_min, x_max, min(y_values), max(y_values)


def full_bounds(frames: list[Frame]) -> tuple[float, float, float, float]:
    root = find_root(frames)
    return root.x, root.right, min(frame.y for frame in frames), max(frame.y for frame in frames)


def visible_frames(frames: list[Frame], bounds: tuple[float, float, float, float]) -> list[Frame]:
    x_min, x_max, y_min, y_max = bounds
    crop_width = x_max - x_min
    min_width = max(crop_width * 0.0025, 1.2)
    shown = [
        frame
        for frame in frames
        if frame.right >= x_min
        and frame.x <= x_max
        and y_min <= frame.y <= y_max
        and (frame.width >= min_width or frame.name == "all")
    ]
    shown.sort(key=lambda frame: (frame.y, -frame.width))
    return shown


def matching_frames(frames: list[Frame], keywords: Iterable[str]) -> list[Frame]:
    lowered = [keyword.lower() for keyword in keywords if keyword]
    if not lowered:
        return []
    matches = [frame for frame in frames if any(keyword in frame.name.lower() for keyword in lowered)]
    matches.sort(key=lambda frame: (frame.width, frame.pct), reverse=True)
    return matches


def matched_keyword(name: str, keywords: Iterable[str]) -> str | None:
    lowered_name = name.lower()
    for keyword in keywords:
        if keyword and keyword.lower() in lowered_name:
            return keyword
    return None


def is_hex_only_name(name: str) -> bool:
    return bool(HEX_ONLY_RE.fullmatch(name.strip()))


def stable_color(name: str) -> str:
    if is_hex_only_name(name):
        return "#a5a5a5"
    digest = hashlib.md5(name.encode("utf-8")).hexdigest()
    r = 125 + int(digest[0:2], 16) % 55
    g = 135 + int(digest[2:4], 16) % 55
    b = 145 + int(digest[4:6], 16) % 55
    return f"#{r:02x}{g:02x}{b:02x}"


def highlight_palette() -> list[str]:
    return ["#ff5a36", "#0077ff", "#00a86b", "#f39c12", "#c039ff", "#e6397a"]


def keyword_color_map(keywords: list[str]) -> dict[str, str]:
    palette = highlight_palette()
    return {keyword: palette[idx % len(palette)] for idx, keyword in enumerate(keywords)}


def shorten(name: str, limit: int = 34) -> str:
    return name if len(name) <= limit else name[: limit - 2] + ".."


def display_name(name: str, limit: int = 80) -> str:
    head = name.split("(", 1)[0].strip()
    if head:
        return head if len(head) <= limit else head[: limit - 2] + ".."
    return shorten(name, limit)


def draw_panel(ax, frames: list[Frame], bounds: tuple[float, float, float, float], title: str, highlight_keywords: list[str]) -> None:
    x_min, x_max, y_min, y_max = bounds
    color_map = keyword_color_map(highlight_keywords)
    visible = visible_frames(frames, bounds)
    frame_step = visible[0].height if visible else 15.0
    found_keywords = [keyword for keyword in highlight_keywords if any(matched_keyword(frame.name, [keyword]) for frame in visible)]

    for frame in visible:
        keyword = matched_keyword(frame.name, highlight_keywords)
        facecolor = color_map[keyword] if keyword else stable_color(frame.name)
        edgecolor = "#f7f4ef"
        linewidth = 0.5
        rect = Rectangle((frame.x, frame.y), frame.width, frame.height, facecolor=facecolor, edgecolor=edgecolor, linewidth=linewidth)
        ax.add_patch(rect)

    ax.set_xlim(x_min, x_max)
    ax.set_ylim(y_max + 18, y_min - 5)
    x_ticks = np.linspace(x_min, x_max, 5)
    ax.set_xticks(x_ticks)
    ax.set_xticklabels([f"{int(round(v))}%" for v in np.linspace(0, 100, 5)], fontsize=9)

    depth_count = max(2, min(6, int(round((y_max - y_min) / frame_step)) + 1))
    y_tick_pos = np.linspace(y_max, y_min, depth_count)
    y_tick_labels = [str(int(round((y_max - y) / frame_step))) for y in y_tick_pos]
    ax.set_yticks(y_tick_pos)
    ax.set_yticklabels(y_tick_labels, fontsize=9)

    ax.set_xlabel("Sample Span", fontsize=10)
    ax.set_ylabel("Stack Depth", fontsize=10)
    ax.set_title(title, fontsize=13, fontweight="bold", loc="left", pad=8)
    ax.set_facecolor("#fbfaf7")
    for spine in ax.spines.values():
        spine.set_edgecolor("#cfc7bb")
        spine.set_linewidth(1.0)
    ax.tick_params(axis="both", colors="#333333", length=3, width=0.8)
    draw_inline_legend(ax, found_keywords, color_map)


def render_figure(baseline_svg: Path, optimized_svg: Path, output: Path, highlight_keywords: list[str]) -> None:
    baseline_frames = load_frames(baseline_svg)
    optimized_frames = load_frames(optimized_svg)
    baseline_bounds = full_bounds(baseline_frames)
    optimized_bounds = full_bounds(optimized_frames)

    fig, axes = plt.subplots(2, 1, figsize=(12.5, 8.2))
    fig.patch.set_facecolor("#f6f2ea")

    draw_panel(axes[0], baseline_frames, baseline_bounds, "Baseline", highlight_keywords)
    draw_panel(axes[1], optimized_frames, optimized_bounds, "Optimized", highlight_keywords)

    plt.subplots_adjust(left=0.03, right=0.985, top=0.96, bottom=0.045, hspace=0.16)
    fig.savefig(output, bbox_inches="tight")
    plt.close(fig)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Render a thesis-friendly flamechart comparison with matplotlib.")
    parser.add_argument("baseline_svg", type=Path)
    parser.add_argument("optimized_svg", type=Path)
    parser.add_argument("-o", "--output", type=Path, default=Path("thesis_flamegraph_comparison.svg"))
    parser.add_argument("--highlight", action="append", default=[])
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    highlight_keywords = args.highlight or ["extractRawFieldBytes", "parseNonStringValueIntoNautilusRecord"]
    render_figure(args.baseline_svg, args.optimized_svg, args.output, highlight_keywords)


if __name__ == "__main__":
    main()
