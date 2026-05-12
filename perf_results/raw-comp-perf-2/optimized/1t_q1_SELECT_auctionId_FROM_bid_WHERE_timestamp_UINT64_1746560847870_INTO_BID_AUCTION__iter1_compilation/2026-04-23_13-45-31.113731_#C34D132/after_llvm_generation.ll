; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: memory(readwrite, errnomem: none)
declare i32 @"0x56317de50b80"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x56317de50bb0"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i64 @"0x56317e154b50"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i64 @"0x56317e154820"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i64 @"0x56317e154c70"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i64 @"0x56317e154c40"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i64 @"0x56317e1549f0"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i1 @"0x56317e154ae0"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x56317e0a6090"(ptr, ptr, ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x56317de685e0"(ptr, ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x56317de51120"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x56317e1547a0"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x56317e09de50"() local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x56317e09ff80"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x56317e154720"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x56317e154bc0"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x56317e154890"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x56317e154900"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x56317e154ca0"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x56317de510a0"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x56317de3f290"(ptr, i1, i64, i1, ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x56317de50cb0"(ptr, ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i32 @"0x56317e0b81f0"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i32 @"0x7fa61d7be380"(ptr, ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i1 @"0x56317e0a28b0"(ptr, ptr, ptr) local_unnamed_addr #0

define void @execute(ptr %0, ptr %1, ptr %2) local_unnamed_addr #1 {
  %4 = tail call i32 @"0x56317de50b80"(ptr %0)
  %5 = tail call ptr @"0x56317de50bb0"(ptr %0)
  %6 = tail call i64 @"0x56317e154b50"(ptr %1)
  %7 = tail call i64 @"0x56317e154820"(ptr %1)
  %8 = tail call i64 @"0x56317e154c70"(ptr %1)
  %9 = tail call i64 @"0x56317e154c40"(ptr %1)
  %10 = tail call i64 @"0x56317e1549f0"(ptr %1)
  %11 = tail call i1 @"0x56317e154ae0"(ptr %1)
  %12 = tail call ptr @"0x56317e0a6090"(ptr %1, ptr nonnull inttoptr (i64 140341948759656 to ptr), ptr %2)
  %13 = getelementptr i8, ptr %12, i64 34
  %14 = load i1, ptr %13, align 1
  br i1 %14, label %15, label %127

15:                                               ; preds = %3
  tail call void @"0x56317de685e0"(ptr %0, ptr %1)
  br label %16

16:                                               ; preds = %15, %39
  ret void

17:                                               ; preds = %127
  %18 = getelementptr i8, ptr %130, i64 48
  %19 = load ptr, ptr %130, align 8
  %20 = tail call ptr @"0x56317e09ff80"(ptr %18)
  %21 = getelementptr i8, ptr %20, i64 4
  %22 = load i32, ptr %20, align 4
  %23 = load i32, ptr %21, align 4
  %24 = sub i32 %23, %22
  %25 = getelementptr i8, ptr %20, i64 8
  %26 = load i32, ptr %25, align 4
  %27 = sub i32 %26, %23
  %28 = zext i32 %27 to i64
  %29 = add nsw i64 %28, -1
  %30 = zext i32 %23 to i64
  %31 = getelementptr i8, ptr %19, i64 %30
  %.not = icmp eq i32 %24, 14
  br i1 %.not, label %123, label %35

32:                                               ; preds = %123
  %33 = tail call ptr @"0x56317e1547a0"(ptr %128)
  %34 = tail call i32 @"0x56317e0b81f0"(ptr %31, i64 %29)
  store i32 %34, ptr %33, align 4
  br label %35

35:                                               ; preds = %17, %32, %123, %127
  %36 = phi i64 [ 0, %123 ], [ 1, %32 ], [ 0, %127 ], [ 0, %17 ]
  %37 = getelementptr i8, ptr %130, i64 33
  %38 = load i1, ptr %37, align 1
  br i1 %38, label %43, label %39

39:                                               ; preds = %89, %111, %119, %.outer._crit_edge, %35
  %40 = phi ptr [ %.ph.lcssa, %119 ], [ %112, %111 ], [ %.ph.lcssa, %.outer._crit_edge ], [ %128, %35 ], [ %.ph.lcssa, %89 ]
  %41 = phi i64 [ %.ph10.lcssa, %119 ], [ %118, %111 ], [ %.ph10.lcssa, %.outer._crit_edge ], [ %36, %35 ], [ %.ph10.lcssa, %89 ]
  tail call void @"0x56317e154720"(ptr %40, i64 %41)
  tail call void @"0x56317e154bc0"(ptr %40, i64 %6)
  tail call void @"0x56317e154890"(ptr %40, i64 %7)
  tail call void @"0x56317e154900"(ptr %40, i64 %9)
  tail call void @"0x56317e154ca0"(ptr %40, i64 %8)
  %42 = tail call ptr @"0x56317de510a0"(ptr %0, i64 1)
  tail call void @"0x56317de3f290"(ptr %42, i1 true, i64 %10, i1 %11, ptr %40)
  tail call void @"0x56317de50cb0"(ptr %0, ptr %40)
  br label %16

43:                                               ; preds = %35
  %44 = getelementptr i8, ptr %130, i64 176
  %45 = getelementptr i8, ptr %130, i64 200
  %46 = load i64, ptr %45, align 4
  %.not29 = icmp eq i64 %46, 0
  br i1 %.not29, label %.outer._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %43, %.outer
  %.ph1126 = phi i64 [ %75, %.outer ], [ 0, %43 ]
  %.ph1025 = phi i64 [ %74, %.outer ], [ %36, %43 ]
  %.ph24 = phi ptr [ %68, %.outer ], [ %128, %43 ]
  br label %47

47:                                               ; preds = %.lr.ph, %78
  %48 = phi i64 [ %.ph1126, %.lr.ph ], [ %79, %78 ]
  %49 = tail call ptr @"0x56317e1547a0"(ptr %1)
  %50 = tail call ptr @"0x56317e09ff80"(ptr %44)
  %51 = mul i64 %48, 20
  %52 = getelementptr i8, ptr %50, i64 %51
  %53 = getelementptr i8, ptr %52, i64 4
  %54 = load i32, ptr %52, align 4
  %55 = load i32, ptr %53, align 4
  %56 = sub i32 %55, %54
  %.not8 = icmp eq i32 %56, 14
  br i1 %.not8, label %82, label %78

57:                                               ; preds = %82
  %58 = sub i32 %84, %55
  %59 = zext i32 %58 to i64
  %60 = add nsw i64 %59, -1
  %61 = zext i32 %55 to i64
  %62 = getelementptr i8, ptr %49, i64 %61
  %63 = icmp ugt i64 %.ph1025, 65535
  br i1 %63, label %64, label %.outer

64:                                               ; preds = %57
  tail call void @"0x56317e154720"(ptr %.ph24, i64 %.ph1025)
  tail call void @"0x56317e154bc0"(ptr %.ph24, i64 %6)
  tail call void @"0x56317e154890"(ptr %.ph24, i64 %7)
  tail call void @"0x56317e154900"(ptr %.ph24, i64 %9)
  tail call void @"0x56317e154ca0"(ptr %.ph24, i64 %8)
  %65 = tail call ptr @"0x56317de510a0"(ptr %0, i64 1)
  tail call void @"0x56317de3f290"(ptr %65, i1 false, i64 %10, i1 %11, ptr %.ph24)
  tail call void @"0x56317de50cb0"(ptr %0, ptr %.ph24)
  %66 = tail call ptr @"0x56317de51120"(ptr %0)
  %67 = tail call ptr @"0x56317e1547a0"(ptr %66)
  br label %.outer

.outer:                                           ; preds = %64, %57
  %68 = phi ptr [ %66, %64 ], [ %.ph24, %57 ]
  %69 = phi i64 [ 0, %64 ], [ %.ph1025, %57 ]
  %70 = tail call ptr @"0x56317e1547a0"(ptr %68)
  %71 = shl nuw nsw i64 %69, 2
  %72 = getelementptr i8, ptr %70, i64 %71
  %73 = tail call i32 @"0x56317e0b81f0"(ptr %62, i64 %60)
  store i32 %73, ptr %72, align 4
  %74 = add nuw nsw i64 %69, 1
  %75 = add nuw i64 %48, 1
  %76 = load i64, ptr %45, align 4
  %77 = icmp ult i64 %75, %76
  br i1 %77, label %.lr.ph, label %.outer._crit_edge

78:                                               ; preds = %47, %82
  %79 = add nuw i64 %48, 1
  %80 = load i64, ptr %45, align 4
  %81 = icmp ult i64 %79, %80
  br i1 %81, label %47, label %.outer._crit_edge

82:                                               ; preds = %47
  %83 = getelementptr i8, ptr %52, i64 8
  %84 = load i32, ptr %83, align 4
  %85 = zext i32 %54 to i64
  %86 = getelementptr i8, ptr %49, i64 %85
  %87 = tail call i32 @"0x7fa61d7be380"(ptr %86, ptr nonnull inttoptr (i64 140341009224569 to ptr), i64 13)
  %.not9 = icmp eq i32 %87, 0
  br i1 %.not9, label %57, label %78

.outer._crit_edge:                                ; preds = %.outer, %78, %43
  %.ph.lcssa = phi ptr [ %128, %43 ], [ %.ph24, %78 ], [ %68, %.outer ]
  %.ph10.lcssa = phi i64 [ %36, %43 ], [ %.ph1025, %78 ], [ %74, %.outer ]
  %88 = tail call i1 @"0x56317e0a28b0"(ptr %1, ptr nonnull inttoptr (i64 140341948759656 to ptr), ptr %2)
  br i1 %88, label %89, label %39

89:                                               ; preds = %.outer._crit_edge
  %90 = getelementptr i8, ptr %130, i64 112
  %91 = getelementptr i8, ptr %130, i64 16
  %92 = load ptr, ptr %91, align 8
  %93 = tail call ptr @"0x56317e09ff80"(ptr %90)
  %94 = getelementptr i8, ptr %93, i64 4
  %95 = load i32, ptr %93, align 4
  %96 = load i32, ptr %94, align 4
  %97 = sub i32 %96, %95
  %98 = getelementptr i8, ptr %93, i64 8
  %99 = load i32, ptr %98, align 4
  %100 = sub i32 %99, %96
  %101 = zext i32 %100 to i64
  %102 = add nsw i64 %101, -1
  %103 = zext i32 %96 to i64
  %104 = getelementptr i8, ptr %92, i64 %103
  %.not6 = icmp eq i32 %97, 14
  br i1 %.not6, label %119, label %39

105:                                              ; preds = %119
  %106 = icmp ugt i64 %.ph10.lcssa, 65535
  br i1 %106, label %107, label %111

107:                                              ; preds = %105
  tail call void @"0x56317e154720"(ptr %.ph.lcssa, i64 %.ph10.lcssa)
  tail call void @"0x56317e154bc0"(ptr %.ph.lcssa, i64 %6)
  tail call void @"0x56317e154890"(ptr %.ph.lcssa, i64 %7)
  tail call void @"0x56317e154900"(ptr %.ph.lcssa, i64 %9)
  tail call void @"0x56317e154ca0"(ptr %.ph.lcssa, i64 %8)
  %108 = tail call ptr @"0x56317de510a0"(ptr %0, i64 1)
  tail call void @"0x56317de3f290"(ptr %108, i1 false, i64 %10, i1 %11, ptr %.ph.lcssa)
  tail call void @"0x56317de50cb0"(ptr %0, ptr %.ph.lcssa)
  %109 = tail call ptr @"0x56317de51120"(ptr %0)
  %110 = tail call ptr @"0x56317e1547a0"(ptr %109)
  br label %111

111:                                              ; preds = %107, %105
  %112 = phi ptr [ %109, %107 ], [ %.ph.lcssa, %105 ]
  %113 = phi i64 [ 0, %107 ], [ %.ph10.lcssa, %105 ]
  %114 = tail call ptr @"0x56317e1547a0"(ptr %112)
  %115 = shl nuw nsw i64 %113, 2
  %116 = getelementptr i8, ptr %114, i64 %115
  %117 = tail call i32 @"0x56317e0b81f0"(ptr %104, i64 %102)
  store i32 %117, ptr %116, align 4
  %118 = add nuw nsw i64 %113, 1
  br label %39

119:                                              ; preds = %89
  %120 = zext i32 %95 to i64
  %121 = getelementptr i8, ptr %92, i64 %120
  %122 = tail call i32 @"0x7fa61d7be380"(ptr %121, ptr nonnull inttoptr (i64 140341009224569 to ptr), i64 13)
  %.not7 = icmp eq i32 %122, 0
  br i1 %.not7, label %105, label %39

123:                                              ; preds = %17
  %124 = zext i32 %22 to i64
  %125 = getelementptr i8, ptr %19, i64 %124
  %126 = tail call i32 @"0x7fa61d7be380"(ptr %125, ptr nonnull inttoptr (i64 140341009224569 to ptr), i64 13)
  %.not5 = icmp eq i32 %126, 0
  br i1 %.not5, label %32, label %35

127:                                              ; preds = %3
  %128 = tail call ptr @"0x56317de51120"(ptr %0)
  %129 = tail call ptr @"0x56317e1547a0"(ptr %128)
  %130 = tail call ptr @"0x56317e09de50"()
  %131 = getelementptr i8, ptr %130, i64 32
  %132 = load i1, ptr %131, align 1
  br i1 %132, label %17, label %35
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
