; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: memory(readwrite, errnomem: none)
declare i32 @"0x5646371f6cb0"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x5646371f6ce0"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i64 @"0x56463747fbb0"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i64 @"0x56463747f880"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i64 @"0x56463747fcd0"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i64 @"0x56463747fca0"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i64 @"0x56463747fa50"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i1 @"0x56463747fb40"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x564637468fa0"(ptr, ptr, ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x56463720f4a0"(ptr, ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x5646371f7250"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x56463747f800"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x5646374648c0"() local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i32 @"0x564637476c60"(i32, ptr, ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x56463746c440"(i32, ptr, ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i64 @"0x5646374785c0"(i32, ptr, ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x564637466310"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x56463747f780"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x56463747fc20"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x56463747f8f0"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x56463747f960"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x56463747fd00"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x5646371f71d0"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x5646371e48f0"(ptr, i1, i64, i1, ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x5646371f6de0"(ptr, ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i32 @"0x7f91dd454380"(ptr, ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i1 @"0x564637467c90"(ptr, ptr, ptr) local_unnamed_addr #0

define void @execute(ptr %0, ptr %1, ptr %2) local_unnamed_addr #1 {
  %4 = tail call i32 @"0x5646371f6cb0"(ptr %0)
  %5 = tail call ptr @"0x5646371f6ce0"(ptr %0)
  %6 = tail call i64 @"0x56463747fbb0"(ptr %1)
  %7 = tail call i64 @"0x56463747f880"(ptr %1)
  %8 = tail call i64 @"0x56463747fcd0"(ptr %1)
  %9 = tail call i64 @"0x56463747fca0"(ptr %1)
  %10 = tail call i64 @"0x56463747fa50"(ptr %1)
  %11 = tail call i1 @"0x56463747fb40"(ptr %1)
  %12 = tail call ptr @"0x564637468fa0"(ptr %1, ptr nonnull inttoptr (i64 140253700575080 to ptr), ptr %2)
  %13 = getelementptr i8, ptr %12, i64 34
  %14 = load i1, ptr %13, align 1
  br i1 %14, label %15, label %130

15:                                               ; preds = %3
  tail call void @"0x56463720f4a0"(ptr %0, ptr %1)
  br label %16

16:                                               ; preds = %15, %40
  ret void

17:                                               ; preds = %130
  %18 = getelementptr i8, ptr %133, i64 48
  %19 = tail call i32 @"0x564637476c60"(i32 0, ptr %18, ptr nonnull inttoptr (i64 140253700575088 to ptr))
  %20 = tail call ptr @"0x56463746c440"(i32 1, ptr %18, ptr nonnull inttoptr (i64 140253700575088 to ptr))
  %21 = tail call ptr @"0x56463746c440"(i32 2, ptr %18, ptr nonnull inttoptr (i64 140253700575088 to ptr))
  %22 = tail call ptr @"0x56463746c440"(i32 3, ptr %18, ptr nonnull inttoptr (i64 140253700575088 to ptr))
  %23 = tail call ptr @"0x56463746c440"(i32 4, ptr %18, ptr nonnull inttoptr (i64 140253700575088 to ptr))
  %24 = load ptr, ptr %23, align 8
  %25 = getelementptr i8, ptr %23, i64 8
  %26 = load i64, ptr %25, align 4
  %27 = tail call ptr @"0x56463746c440"(i32 5, ptr %18, ptr nonnull inttoptr (i64 140253700575088 to ptr))
  %28 = load ptr, ptr %27, align 8
  %29 = getelementptr i8, ptr %27, i64 8
  %30 = load i64, ptr %29, align 4
  %31 = tail call i64 @"0x5646374785c0"(i32 6, ptr %18, ptr nonnull inttoptr (i64 140253700575088 to ptr))
  %32 = tail call ptr @"0x56463746c440"(i32 7, ptr %18, ptr nonnull inttoptr (i64 140253700575088 to ptr))
  tail call void @"0x564637466310"(ptr %18)
  %.not = icmp eq i64 %30, 2
  br i1 %.not, label %125, label %33

33:                                               ; preds = %17
  %.not14 = icmp eq i64 %26, 7
  br i1 %.not14, label %123, label %36

34:                                               ; preds = %127
  %35 = tail call ptr @"0x56463747f800"(ptr %131)
  store i32 %19, ptr %35, align 4
  br label %36

36:                                               ; preds = %125, %33, %123, %34, %127, %130
  %37 = phi i64 [ 0, %127 ], [ 0, %123 ], [ 1, %34 ], [ 0, %130 ], [ 0, %33 ], [ 0, %125 ]
  %38 = getelementptr i8, ptr %133, i64 33
  %39 = load i1, ptr %38, align 1
  br i1 %39, label %44, label %40

40:                                               ; preds = %118, %102, %116, %109, %120, %.outer._crit_edge, %36
  %41 = phi ptr [ %.ph.lcssa, %120 ], [ %.ph.lcssa, %116 ], [ %110, %109 ], [ %.ph.lcssa, %.outer._crit_edge ], [ %131, %36 ], [ %.ph.lcssa, %102 ], [ %.ph.lcssa, %118 ]
  %42 = phi i64 [ %.ph23.lcssa, %120 ], [ %.ph23.lcssa, %116 ], [ %115, %109 ], [ %.ph23.lcssa, %.outer._crit_edge ], [ %37, %36 ], [ %.ph23.lcssa, %102 ], [ %.ph23.lcssa, %118 ]
  tail call void @"0x56463747f780"(ptr %41, i64 %42)
  tail call void @"0x56463747fc20"(ptr %41, i64 %6)
  tail call void @"0x56463747f8f0"(ptr %41, i64 %7)
  tail call void @"0x56463747f960"(ptr %41, i64 %9)
  tail call void @"0x56463747fd00"(ptr %41, i64 %8)
  %43 = tail call ptr @"0x5646371f71d0"(ptr %0, i64 2)
  tail call void @"0x5646371e48f0"(ptr %43, i1 true, i64 %10, i1 %11, ptr %41)
  tail call void @"0x5646371f6de0"(ptr %0, ptr %41)
  br label %16

44:                                               ; preds = %36
  %45 = getelementptr i8, ptr %133, i64 192
  %46 = load i1, ptr %45, align 1
  br i1 %46, label %.outer._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %44, %.outer
  %.ph2328 = phi i64 [ %75, %.outer ], [ %37, %44 ]
  %.ph27 = phi ptr [ %70, %.outer ], [ %131, %44 ]
  br label %47

47:                                               ; preds = %.lr.ph, %.backedge
  %48 = tail call ptr @"0x56463747f800"(ptr %1)
  %49 = tail call i32 @"0x564637476c60"(i32 0, ptr nonnull %45, ptr nonnull inttoptr (i64 140253700575088 to ptr))
  %50 = tail call ptr @"0x56463746c440"(i32 1, ptr nonnull %45, ptr nonnull inttoptr (i64 140253700575088 to ptr))
  %51 = tail call ptr @"0x56463746c440"(i32 2, ptr nonnull %45, ptr nonnull inttoptr (i64 140253700575088 to ptr))
  %52 = tail call ptr @"0x56463746c440"(i32 3, ptr nonnull %45, ptr nonnull inttoptr (i64 140253700575088 to ptr))
  %53 = tail call ptr @"0x56463746c440"(i32 4, ptr nonnull %45, ptr nonnull inttoptr (i64 140253700575088 to ptr))
  %54 = load ptr, ptr %53, align 8
  %55 = getelementptr i8, ptr %53, i64 8
  %56 = load i64, ptr %55, align 4
  %57 = tail call ptr @"0x56463746c440"(i32 5, ptr nonnull %45, ptr nonnull inttoptr (i64 140253700575088 to ptr))
  %58 = load ptr, ptr %57, align 8
  %59 = getelementptr i8, ptr %57, i64 8
  %60 = load i64, ptr %59, align 4
  %61 = tail call i64 @"0x5646374785c0"(i32 6, ptr nonnull %45, ptr nonnull inttoptr (i64 140253700575088 to ptr))
  %62 = tail call ptr @"0x56463746c440"(i32 7, ptr nonnull %45, ptr nonnull inttoptr (i64 140253700575088 to ptr))
  tail call void @"0x564637466310"(ptr nonnull %45)
  %.not19 = icmp eq i64 %60, 2
  br i1 %.not19, label %79, label %63

63:                                               ; preds = %47
  %.not22 = icmp eq i64 %56, 7
  br i1 %.not22, label %77, label %.backedge

64:                                               ; preds = %81
  %65 = icmp ugt i64 %.ph2328, 65535
  br i1 %65, label %66, label %.outer

66:                                               ; preds = %64
  tail call void @"0x56463747f780"(ptr %.ph27, i64 %.ph2328)
  tail call void @"0x56463747fc20"(ptr %.ph27, i64 %6)
  tail call void @"0x56463747f8f0"(ptr %.ph27, i64 %7)
  tail call void @"0x56463747f960"(ptr %.ph27, i64 %9)
  tail call void @"0x56463747fd00"(ptr %.ph27, i64 %8)
  %67 = tail call ptr @"0x5646371f71d0"(ptr %0, i64 2)
  tail call void @"0x5646371e48f0"(ptr %67, i1 false, i64 %10, i1 %11, ptr %.ph27)
  tail call void @"0x5646371f6de0"(ptr %0, ptr %.ph27)
  %68 = tail call ptr @"0x5646371f7250"(ptr %0)
  %69 = tail call ptr @"0x56463747f800"(ptr %68)
  br label %.outer

.outer:                                           ; preds = %66, %64
  %70 = phi ptr [ %68, %66 ], [ %.ph27, %64 ]
  %71 = phi i64 [ 0, %66 ], [ %.ph2328, %64 ]
  %72 = tail call ptr @"0x56463747f800"(ptr %70)
  %73 = shl nuw nsw i64 %71, 2
  %74 = getelementptr i8, ptr %72, i64 %73
  store i32 %49, ptr %74, align 4
  %75 = add nuw nsw i64 %71, 1
  %76 = load i1, ptr %45, align 1
  br i1 %76, label %.outer._crit_edge, label %.lr.ph

77:                                               ; preds = %63
  %78 = tail call i32 @"0x7f91dd454380"(ptr %54, ptr nonnull inttoptr (i64 140253700583328 to ptr), i64 7)
  br label %.backedge

79:                                               ; preds = %47
  %80 = tail call i32 @"0x7f91dd454380"(ptr %58, ptr nonnull inttoptr (i64 140253700583856 to ptr), i64 2)
  %.not20 = icmp eq i64 %56, 7
  br i1 %.not20, label %81, label %.backedge

81:                                               ; preds = %79
  %82 = tail call i32 @"0x7f91dd454380"(ptr %54, ptr nonnull inttoptr (i64 140253700583328 to ptr), i64 7)
  %83 = or i32 %82, %80
  %.not21 = icmp eq i32 %83, 0
  br i1 %.not21, label %64, label %.backedge

.backedge:                                        ; preds = %81, %77, %63, %79
  %84 = load i1, ptr %45, align 1
  br i1 %84, label %.outer._crit_edge, label %47

.outer._crit_edge:                                ; preds = %.outer, %.backedge, %44
  %.ph.lcssa = phi ptr [ %131, %44 ], [ %.ph27, %.backedge ], [ %70, %.outer ]
  %.ph23.lcssa = phi i64 [ %37, %44 ], [ %.ph2328, %.backedge ], [ %75, %.outer ]
  %85 = tail call i1 @"0x564637467c90"(ptr %1, ptr nonnull inttoptr (i64 140253700575080 to ptr), ptr %2)
  br i1 %85, label %86, label %40

86:                                               ; preds = %.outer._crit_edge
  %87 = getelementptr i8, ptr %133, i64 120
  %88 = tail call i32 @"0x564637476c60"(i32 0, ptr %87, ptr nonnull inttoptr (i64 140253700575088 to ptr))
  %89 = tail call ptr @"0x56463746c440"(i32 1, ptr %87, ptr nonnull inttoptr (i64 140253700575088 to ptr))
  %90 = tail call ptr @"0x56463746c440"(i32 2, ptr %87, ptr nonnull inttoptr (i64 140253700575088 to ptr))
  %91 = tail call ptr @"0x56463746c440"(i32 3, ptr %87, ptr nonnull inttoptr (i64 140253700575088 to ptr))
  %92 = tail call ptr @"0x56463746c440"(i32 4, ptr %87, ptr nonnull inttoptr (i64 140253700575088 to ptr))
  %93 = load ptr, ptr %92, align 8
  %94 = getelementptr i8, ptr %92, i64 8
  %95 = load i64, ptr %94, align 4
  %96 = tail call ptr @"0x56463746c440"(i32 5, ptr %87, ptr nonnull inttoptr (i64 140253700575088 to ptr))
  %97 = load ptr, ptr %96, align 8
  %98 = getelementptr i8, ptr %96, i64 8
  %99 = load i64, ptr %98, align 4
  %100 = tail call i64 @"0x5646374785c0"(i32 6, ptr %87, ptr nonnull inttoptr (i64 140253700575088 to ptr))
  %101 = tail call ptr @"0x56463746c440"(i32 7, ptr %87, ptr nonnull inttoptr (i64 140253700575088 to ptr))
  tail call void @"0x564637466310"(ptr %87)
  %.not15 = icmp eq i64 %99, 2
  br i1 %.not15, label %118, label %102

102:                                              ; preds = %86
  %.not18 = icmp eq i64 %95, 7
  br i1 %.not18, label %116, label %40

103:                                              ; preds = %120
  %104 = icmp ugt i64 %.ph23.lcssa, 65535
  br i1 %104, label %105, label %109

105:                                              ; preds = %103
  tail call void @"0x56463747f780"(ptr %.ph.lcssa, i64 %.ph23.lcssa)
  tail call void @"0x56463747fc20"(ptr %.ph.lcssa, i64 %6)
  tail call void @"0x56463747f8f0"(ptr %.ph.lcssa, i64 %7)
  tail call void @"0x56463747f960"(ptr %.ph.lcssa, i64 %9)
  tail call void @"0x56463747fd00"(ptr %.ph.lcssa, i64 %8)
  %106 = tail call ptr @"0x5646371f71d0"(ptr %0, i64 2)
  tail call void @"0x5646371e48f0"(ptr %106, i1 false, i64 %10, i1 %11, ptr %.ph.lcssa)
  tail call void @"0x5646371f6de0"(ptr %0, ptr %.ph.lcssa)
  %107 = tail call ptr @"0x5646371f7250"(ptr %0)
  %108 = tail call ptr @"0x56463747f800"(ptr %107)
  br label %109

109:                                              ; preds = %105, %103
  %110 = phi ptr [ %107, %105 ], [ %.ph.lcssa, %103 ]
  %111 = phi i64 [ 0, %105 ], [ %.ph23.lcssa, %103 ]
  %112 = tail call ptr @"0x56463747f800"(ptr %110)
  %113 = shl nuw nsw i64 %111, 2
  %114 = getelementptr i8, ptr %112, i64 %113
  store i32 %88, ptr %114, align 4
  %115 = add nuw nsw i64 %111, 1
  br label %40

116:                                              ; preds = %102
  %117 = tail call i32 @"0x7f91dd454380"(ptr %93, ptr nonnull inttoptr (i64 140253700583328 to ptr), i64 7)
  br label %40

118:                                              ; preds = %86
  %119 = tail call i32 @"0x7f91dd454380"(ptr %97, ptr nonnull inttoptr (i64 140253700583856 to ptr), i64 2)
  %.not16 = icmp eq i64 %95, 7
  br i1 %.not16, label %120, label %40

120:                                              ; preds = %118
  %121 = tail call i32 @"0x7f91dd454380"(ptr %93, ptr nonnull inttoptr (i64 140253700583328 to ptr), i64 7)
  %122 = or i32 %121, %119
  %.not17 = icmp eq i32 %122, 0
  br i1 %.not17, label %103, label %40

123:                                              ; preds = %33
  %124 = tail call i32 @"0x7f91dd454380"(ptr %24, ptr nonnull inttoptr (i64 140253700583328 to ptr), i64 7)
  br label %36

125:                                              ; preds = %17
  %126 = tail call i32 @"0x7f91dd454380"(ptr %28, ptr nonnull inttoptr (i64 140253700583856 to ptr), i64 2)
  %.not12 = icmp eq i64 %26, 7
  br i1 %.not12, label %127, label %36

127:                                              ; preds = %125
  %128 = tail call i32 @"0x7f91dd454380"(ptr %24, ptr nonnull inttoptr (i64 140253700583328 to ptr), i64 7)
  %129 = or i32 %128, %126
  %.not13 = icmp eq i32 %129, 0
  br i1 %.not13, label %34, label %36

130:                                              ; preds = %3
  %131 = tail call ptr @"0x5646371f7250"(ptr %0)
  %132 = tail call ptr @"0x56463747f800"(ptr %131)
  %133 = tail call ptr @"0x5646374648c0"()
  %134 = getelementptr i8, ptr %133, i64 32
  %135 = load i1, ptr %134, align 1
  br i1 %135, label %17, label %36
}

define void @_mlir_ciface_execute(ptr %0, ptr %1, ptr %2) local_unnamed_addr {
  tail call void @execute(ptr %0, ptr %1, ptr %2)
  ret void
}

define void @_mlir_execute(ptr readonly captures(none) %0) local_unnamed_addr {
  %2 = load ptr, ptr %0, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr i8, ptr %0, i64 8
  %5 = load ptr, ptr %4, align 8
  %6 = load ptr, ptr %5, align 8
  %7 = getelementptr i8, ptr %0, i64 16
  %8 = load ptr, ptr %7, align 8
  %9 = load ptr, ptr %8, align 8
  tail call void @execute(ptr %3, ptr %6, ptr %9)
  ret void
}

define void @_mlir__mlir_ciface_execute(ptr readonly captures(none) %0) local_unnamed_addr {
  %2 = load ptr, ptr %0, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr i8, ptr %0, i64 8
  %5 = load ptr, ptr %4, align 8
  %6 = load ptr, ptr %5, align 8
  %7 = getelementptr i8, ptr %0, i64 16
  %8 = load ptr, ptr %7, align 8
  %9 = load ptr, ptr %8, align 8
  tail call void @execute(ptr %3, ptr %6, ptr %9)
  ret void
}

attributes #0 = { memory(readwrite, errnomem: none) }
attributes #1 = { "target-cpu"="cascadelake" "target-features"="+prfchw,-cldemote,+avx,+aes,+sahf,+pclmul,-xop,+crc32,-amx-fp8,+xsaves,-avx512fp16,-usermsr,-sm4,-egpr,+sse4.1,-avx512ifma,+xsave,+sse4.2,-tsxldtrk,-sm3,-ptwrite,-widekl,-movrs,+invpcid,+64bit,+xsavec,-avx10.1-512,-avx512vpopcntdq,+cmov,-avx512vp2intersect,+avx512cd,+movbe,-avxvnniint8,-ccmp,-amx-int8,-kl,-avx10.1-256,+evex512,-avxvnni,-rtm,+adx,+avx2,-hreset,-movdiri,-serialize,-sha512,-vpclmulqdq,+avx512vl,-uintr,-cf,+clflushopt,-raoint,-cmpccxadd,+bmi,-amx-tile,+sse,-avx10.2-256,-gfni,-avxvnniint16,-amx-fp16,-zu,-ndd,+xsaveopt,+rdrnd,+avx512f,-amx-bf16,-avx512bf16,+avx512vnni,-push2pop2,+cx8,+avx512bw,+sse3,+pku,-nf,-amx-tf32,-amx-avx512,+fsgsbase,-clzero,-mwaitx,-lwp,+lzcnt,-sha,-movdir64b,-ppx,-wbnoinvd,-enqcmd,-amx-transpose,-avx10.2-512,-avxneconvert,-tbm,-pconfig,-amx-complex,+ssse3,+cx16,+bmi2,+fma,+popcnt,-avxifma,+f16c,-avx512bitalg,-rdpru,+clwb,+mmx,+sse2,+rdseed,-avx512vbmi2,-prefetchi,-amx-movrs,-rdpid,-fma4,-avx512vbmi,-shstk,-vaes,-waitpkg,-sgx,+fxsr,+avx512dq,-sse4a" "tune-cpu"="cascadelake" }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
