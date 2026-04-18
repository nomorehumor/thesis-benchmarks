; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: memory(readwrite, errnomem: none)
declare i32 @"0x5604887d2cf0"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x5604887d2d20"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i64 @"0x560488a5cb80"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i64 @"0x560488a5c850"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i64 @"0x560488a5cca0"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i64 @"0x560488a5cc70"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i64 @"0x560488a5ca20"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i1 @"0x560488a5cb10"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x560488a45250"(ptr, ptr, ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x5604887eb4e0"(ptr, ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x5604887d3290"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x560488a5c7d0"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x560488a40b40"() local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i32 @"0x560488a53c30"(i32, ptr, ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x560488a48750"(i32, ptr, ptr, ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i64 @"0x560488a55590"(i32, ptr, ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x560488a425c0"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x560488a5c750"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x560488a5cbf0"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x560488a5c8c0"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x560488a5c930"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x560488a5ccd0"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x5604887d3210"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x5604887c0930"(ptr, i1, i64, i1, ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x5604887d2e20"(ptr, ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x560488a66050"(ptr, ptr, ptr, i64, ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i1 @"0x560488a43f40"(ptr, ptr, ptr) local_unnamed_addr #0

define void @execute(ptr %0, ptr %1, ptr %2) local_unnamed_addr #1 {
  %4 = tail call i32 @"0x5604887d2cf0"(ptr %0)
  %5 = tail call ptr @"0x5604887d2d20"(ptr %0)
  %6 = tail call i64 @"0x560488a5cb80"(ptr %1)
  %7 = tail call i64 @"0x560488a5c850"(ptr %1)
  %8 = tail call i64 @"0x560488a5cca0"(ptr %1)
  %9 = tail call i64 @"0x560488a5cc70"(ptr %1)
  %10 = tail call i64 @"0x560488a5ca20"(ptr %1)
  %11 = tail call i1 @"0x560488a5cb10"(ptr %1)
  %12 = tail call ptr @"0x560488a45250"(ptr %1, ptr nonnull inttoptr (i64 139730922608792 to ptr), ptr %2)
  %13 = getelementptr i8, ptr %12, i64 34
  %14 = load i1, ptr %13, align 1
  br i1 %14, label %15, label %95

15:                                               ; preds = %3
  tail call void @"0x5604887eb4e0"(ptr %0, ptr %1)
  br label %16

16:                                               ; preds = %15, %35
  ret void

17:                                               ; preds = %95
  %18 = getelementptr i8, ptr %98, i64 48
  %19 = tail call i32 @"0x560488a53c30"(i32 0, ptr %18, ptr nonnull inttoptr (i64 139730922608800 to ptr))
  %20 = tail call ptr @"0x560488a48750"(i32 1, ptr %18, ptr nonnull inttoptr (i64 139730922608800 to ptr), ptr %2)
  %21 = tail call ptr @"0x560488a48750"(i32 2, ptr %18, ptr nonnull inttoptr (i64 139730922608800 to ptr), ptr %2)
  %22 = tail call ptr @"0x560488a48750"(i32 3, ptr %18, ptr nonnull inttoptr (i64 139730922608800 to ptr), ptr %2)
  %23 = tail call ptr @"0x560488a48750"(i32 4, ptr %18, ptr nonnull inttoptr (i64 139730922608800 to ptr), ptr %2)
  %24 = tail call ptr @"0x560488a48750"(i32 5, ptr %18, ptr nonnull inttoptr (i64 139730922608800 to ptr), ptr %2)
  %25 = tail call i64 @"0x560488a55590"(i32 6, ptr %18, ptr nonnull inttoptr (i64 139730922608800 to ptr))
  %26 = tail call ptr @"0x560488a48750"(i32 7, ptr %18, ptr nonnull inttoptr (i64 139730922608800 to ptr), ptr %2)
  %27 = load ptr, ptr %26, align 8
  %28 = getelementptr i8, ptr %26, i64 16
  %29 = load i64, ptr %28, align 4
  tail call void @"0x560488a425c0"(ptr %18)
  %30 = tail call ptr @"0x560488a5c7d0"(ptr %96)
  tail call void @"0x560488a66050"(ptr %96, ptr %5, ptr %27, i64 %29, ptr %30)
  br label %31

31:                                               ; preds = %17, %95
  %32 = phi i64 [ 1, %17 ], [ 0, %95 ]
  %33 = getelementptr i8, ptr %98, i64 33
  %34 = load i1, ptr %33, align 1
  br i1 %34, label %39, label %35

35:                                               ; preds = %88, %._crit_edge, %31
  %36 = phi ptr [ %89, %88 ], [ %.lcssa1, %._crit_edge ], [ %96, %31 ]
  %37 = phi i64 [ %94, %88 ], [ %.lcssa, %._crit_edge ], [ %32, %31 ]
  tail call void @"0x560488a5c750"(ptr %36, i64 %37)
  tail call void @"0x560488a5cbf0"(ptr %36, i64 %6)
  tail call void @"0x560488a5c8c0"(ptr %36, i64 %7)
  tail call void @"0x560488a5c930"(ptr %36, i64 %9)
  tail call void @"0x560488a5ccd0"(ptr %36, i64 %8)
  %38 = tail call ptr @"0x5604887d3210"(ptr %0, i64 1)
  tail call void @"0x5604887c0930"(ptr %38, i1 true, i64 %10, i1 %11, ptr %36)
  tail call void @"0x5604887d2e20"(ptr %0, ptr %36)
  br label %16

39:                                               ; preds = %31
  %40 = getelementptr i8, ptr %98, i64 192
  %41 = load i1, ptr %40, align 1
  br i1 %41, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %39, %61
  %42 = phi i64 [ %67, %61 ], [ %32, %39 ]
  %43 = phi ptr [ %62, %61 ], [ %96, %39 ]
  %44 = tail call ptr @"0x560488a5c7d0"(ptr %1)
  %45 = tail call i32 @"0x560488a53c30"(i32 0, ptr nonnull %40, ptr nonnull inttoptr (i64 139730922608800 to ptr))
  %46 = tail call ptr @"0x560488a48750"(i32 1, ptr nonnull %40, ptr nonnull inttoptr (i64 139730922608800 to ptr), ptr %2)
  %47 = tail call ptr @"0x560488a48750"(i32 2, ptr nonnull %40, ptr nonnull inttoptr (i64 139730922608800 to ptr), ptr %2)
  %48 = tail call ptr @"0x560488a48750"(i32 3, ptr nonnull %40, ptr nonnull inttoptr (i64 139730922608800 to ptr), ptr %2)
  %49 = tail call ptr @"0x560488a48750"(i32 4, ptr nonnull %40, ptr nonnull inttoptr (i64 139730922608800 to ptr), ptr %2)
  %50 = tail call ptr @"0x560488a48750"(i32 5, ptr nonnull %40, ptr nonnull inttoptr (i64 139730922608800 to ptr), ptr %2)
  %51 = tail call i64 @"0x560488a55590"(i32 6, ptr nonnull %40, ptr nonnull inttoptr (i64 139730922608800 to ptr))
  %52 = tail call ptr @"0x560488a48750"(i32 7, ptr nonnull %40, ptr nonnull inttoptr (i64 139730922608800 to ptr), ptr %2)
  %53 = load ptr, ptr %52, align 8
  %54 = getelementptr i8, ptr %52, i64 16
  %55 = load i64, ptr %54, align 4
  tail call void @"0x560488a425c0"(ptr nonnull %40)
  %56 = icmp ugt i64 %42, 16383
  br i1 %56, label %57, label %61

57:                                               ; preds = %.lr.ph
  tail call void @"0x560488a5c750"(ptr %43, i64 %42)
  tail call void @"0x560488a5cbf0"(ptr %43, i64 %6)
  tail call void @"0x560488a5c8c0"(ptr %43, i64 %7)
  tail call void @"0x560488a5c930"(ptr %43, i64 %9)
  tail call void @"0x560488a5ccd0"(ptr %43, i64 %8)
  %58 = tail call ptr @"0x5604887d3210"(ptr %0, i64 1)
  tail call void @"0x5604887c0930"(ptr %58, i1 false, i64 %10, i1 %11, ptr %43)
  tail call void @"0x5604887d2e20"(ptr %0, ptr %43)
  %59 = tail call ptr @"0x5604887d3290"(ptr %0)
  %60 = tail call ptr @"0x560488a5c7d0"(ptr %59)
  br label %61

61:                                               ; preds = %57, %.lr.ph
  %62 = phi ptr [ %59, %57 ], [ %43, %.lr.ph ]
  %63 = phi i64 [ 0, %57 ], [ %42, %.lr.ph ]
  %64 = tail call ptr @"0x560488a5c7d0"(ptr %62)
  %65 = shl nuw nsw i64 %63, 4
  %66 = getelementptr i8, ptr %64, i64 %65
  tail call void @"0x560488a66050"(ptr %62, ptr %5, ptr %53, i64 %55, ptr %66)
  %67 = add nuw nsw i64 %63, 1
  %68 = load i1, ptr %40, align 1
  br i1 %68, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %61, %39
  %.lcssa1 = phi ptr [ %96, %39 ], [ %62, %61 ]
  %.lcssa = phi i64 [ %32, %39 ], [ %67, %61 ]
  %69 = tail call i1 @"0x560488a43f40"(ptr %1, ptr nonnull inttoptr (i64 139730922608792 to ptr), ptr %2)
  br i1 %69, label %70, label %35

70:                                               ; preds = %._crit_edge
  %71 = getelementptr i8, ptr %98, i64 120
  %72 = tail call i32 @"0x560488a53c30"(i32 0, ptr %71, ptr nonnull inttoptr (i64 139730922608800 to ptr))
  %73 = tail call ptr @"0x560488a48750"(i32 1, ptr %71, ptr nonnull inttoptr (i64 139730922608800 to ptr), ptr %2)
  %74 = tail call ptr @"0x560488a48750"(i32 2, ptr %71, ptr nonnull inttoptr (i64 139730922608800 to ptr), ptr %2)
  %75 = tail call ptr @"0x560488a48750"(i32 3, ptr %71, ptr nonnull inttoptr (i64 139730922608800 to ptr), ptr %2)
  %76 = tail call ptr @"0x560488a48750"(i32 4, ptr %71, ptr nonnull inttoptr (i64 139730922608800 to ptr), ptr %2)
  %77 = tail call ptr @"0x560488a48750"(i32 5, ptr %71, ptr nonnull inttoptr (i64 139730922608800 to ptr), ptr %2)
  %78 = tail call i64 @"0x560488a55590"(i32 6, ptr %71, ptr nonnull inttoptr (i64 139730922608800 to ptr))
  %79 = tail call ptr @"0x560488a48750"(i32 7, ptr %71, ptr nonnull inttoptr (i64 139730922608800 to ptr), ptr %2)
  %80 = load ptr, ptr %79, align 8
  %81 = getelementptr i8, ptr %79, i64 16
  %82 = load i64, ptr %81, align 4
  tail call void @"0x560488a425c0"(ptr %71)
  %83 = icmp samesign ugt i64 %.lcssa, 16383
  br i1 %83, label %84, label %88

84:                                               ; preds = %70
  tail call void @"0x560488a5c750"(ptr %.lcssa1, i64 %.lcssa)
  tail call void @"0x560488a5cbf0"(ptr %.lcssa1, i64 %6)
  tail call void @"0x560488a5c8c0"(ptr %.lcssa1, i64 %7)
  tail call void @"0x560488a5c930"(ptr %.lcssa1, i64 %9)
  tail call void @"0x560488a5ccd0"(ptr %.lcssa1, i64 %8)
  %85 = tail call ptr @"0x5604887d3210"(ptr %0, i64 1)
  tail call void @"0x5604887c0930"(ptr %85, i1 false, i64 %10, i1 %11, ptr %.lcssa1)
  tail call void @"0x5604887d2e20"(ptr %0, ptr %.lcssa1)
  %86 = tail call ptr @"0x5604887d3290"(ptr %0)
  %87 = tail call ptr @"0x560488a5c7d0"(ptr %86)
  br label %88

88:                                               ; preds = %84, %70
  %89 = phi ptr [ %86, %84 ], [ %.lcssa1, %70 ]
  %90 = phi i64 [ 0, %84 ], [ %.lcssa, %70 ]
  %91 = tail call ptr @"0x560488a5c7d0"(ptr %89)
  %92 = shl nuw nsw i64 %90, 4
  %93 = getelementptr i8, ptr %91, i64 %92
  tail call void @"0x560488a66050"(ptr %89, ptr %5, ptr %80, i64 %82, ptr %93)
  %94 = add nuw nsw i64 %90, 1
  br label %35

95:                                               ; preds = %3
  %96 = tail call ptr @"0x5604887d3290"(ptr %0)
  %97 = tail call ptr @"0x560488a5c7d0"(ptr %96)
  %98 = tail call ptr @"0x560488a40b40"()
  %99 = getelementptr i8, ptr %98, i64 32
  %100 = load i1, ptr %99, align 1
  br i1 %100, label %17, label %31
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
