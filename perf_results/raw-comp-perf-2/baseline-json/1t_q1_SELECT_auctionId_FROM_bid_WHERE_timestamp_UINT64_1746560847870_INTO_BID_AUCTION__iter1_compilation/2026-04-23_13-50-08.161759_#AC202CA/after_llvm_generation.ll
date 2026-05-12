; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: memory(readwrite, errnomem: none)
declare i32 @"0x5632e83034e0"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x5632e8303510"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i64 @"0x5632e860bd00"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i64 @"0x5632e860b9d0"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i64 @"0x5632e860be20"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i64 @"0x5632e860bdf0"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i64 @"0x5632e860bba0"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i1 @"0x5632e860bc90"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x5632e85f5000"(ptr, ptr, ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x5632e831af60"(ptr, ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x5632e8303a80"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x5632e860b950"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x5632e85f0910"() local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i64 @"0x5632e8604710"(i32, ptr, ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i32 @"0x5632e8602db0"(i32, ptr, ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare double @"0x5632e8605480"(i32, ptr, ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x5632e85f2370"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x5632e860b8d0"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x5632e860bd70"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x5632e860ba40"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x5632e860bab0"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x5632e860be50"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x5632e8303a00"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x5632e82f1ac0"(ptr, i1, i64, i1, ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x5632e8303610"(ptr, ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i1 @"0x5632e85f3cf0"(ptr, ptr, ptr) local_unnamed_addr #0

define void @execute(ptr %0, ptr %1, ptr %2) local_unnamed_addr #1 {
  %4 = tail call i32 @"0x5632e83034e0"(ptr %0)
  %5 = tail call ptr @"0x5632e8303510"(ptr %0)
  %6 = tail call i64 @"0x5632e860bd00"(ptr %1)
  %7 = tail call i64 @"0x5632e860b9d0"(ptr %1)
  %8 = tail call i64 @"0x5632e860be20"(ptr %1)
  %9 = tail call i64 @"0x5632e860bdf0"(ptr %1)
  %10 = tail call i64 @"0x5632e860bba0"(ptr %1)
  %11 = tail call i1 @"0x5632e860bc90"(ptr %1)
  %12 = tail call ptr @"0x5632e85f5000"(ptr %1, ptr nonnull inttoptr (i64 139775080189304 to ptr), ptr %2)
  %13 = getelementptr i8, ptr %12, i64 34
  %14 = load i1, ptr %13, align 1
  br i1 %14, label %15, label %77

15:                                               ; preds = %3
  tail call void @"0x5632e831af60"(ptr %0, ptr %1)
  br label %16

16:                                               ; preds = %15, %29
  ret void

17:                                               ; preds = %77
  %18 = getelementptr i8, ptr %80, i64 48
  %19 = tail call i64 @"0x5632e8604710"(i32 0, ptr %18, ptr nonnull inttoptr (i64 139775080189312 to ptr))
  %20 = tail call i32 @"0x5632e8602db0"(i32 1, ptr %18, ptr nonnull inttoptr (i64 139775080189312 to ptr))
  %21 = tail call i32 @"0x5632e8602db0"(i32 2, ptr %18, ptr nonnull inttoptr (i64 139775080189312 to ptr))
  %22 = tail call double @"0x5632e8605480"(i32 3, ptr %18, ptr nonnull inttoptr (i64 139775080189312 to ptr))
  tail call void @"0x5632e85f2370"(ptr %18)
  %.not = icmp eq i64 %19, 1746560847870
  br i1 %.not, label %23, label %25

23:                                               ; preds = %17
  %24 = tail call ptr @"0x5632e860b950"(ptr %78)
  store i32 %20, ptr %24, align 4
  br label %25

25:                                               ; preds = %23, %17, %77
  %26 = phi i64 [ 1, %23 ], [ 0, %17 ], [ 0, %77 ]
  %27 = getelementptr i8, ptr %80, i64 33
  %28 = load i1, ptr %27, align 1
  br i1 %28, label %33, label %29

29:                                               ; preds = %70, %58, %56, %25
  %30 = phi ptr [ %71, %70 ], [ %.ph, %58 ], [ %.ph, %56 ], [ %78, %25 ]
  %31 = phi i64 [ %76, %70 ], [ %.ph3, %58 ], [ %.ph3, %56 ], [ %26, %25 ]
  tail call void @"0x5632e860b8d0"(ptr %30, i64 %31)
  tail call void @"0x5632e860bd70"(ptr %30, i64 %6)
  tail call void @"0x5632e860ba40"(ptr %30, i64 %7)
  tail call void @"0x5632e860bab0"(ptr %30, i64 %9)
  tail call void @"0x5632e860be50"(ptr %30, i64 %8)
  %32 = tail call ptr @"0x5632e8303a00"(ptr %0, i64 1)
  tail call void @"0x5632e82f1ac0"(ptr %32, i1 true, i64 %10, i1 %11, ptr %30)
  tail call void @"0x5632e8303610"(ptr %0, ptr %30)
  br label %16

33:                                               ; preds = %25
  %34 = getelementptr i8, ptr %80, i64 192
  br label %.outer

.outer:                                           ; preds = %33, %49
  %.ph = phi ptr [ %78, %33 ], [ %50, %49 ]
  %.ph3 = phi i64 [ %26, %33 ], [ %55, %49 ]
  br label %35

35:                                               ; preds = %.outer, %37
  %36 = load i1, ptr %34, align 1
  br i1 %36, label %56, label %37

37:                                               ; preds = %35
  %38 = tail call ptr @"0x5632e860b950"(ptr %1)
  %39 = tail call i64 @"0x5632e8604710"(i32 0, ptr nonnull %34, ptr nonnull inttoptr (i64 139775080189312 to ptr))
  %40 = tail call i32 @"0x5632e8602db0"(i32 1, ptr nonnull %34, ptr nonnull inttoptr (i64 139775080189312 to ptr))
  %41 = tail call i32 @"0x5632e8602db0"(i32 2, ptr nonnull %34, ptr nonnull inttoptr (i64 139775080189312 to ptr))
  %42 = tail call double @"0x5632e8605480"(i32 3, ptr nonnull %34, ptr nonnull inttoptr (i64 139775080189312 to ptr))
  tail call void @"0x5632e85f2370"(ptr nonnull %34)
  %.not2 = icmp eq i64 %39, 1746560847870
  br i1 %.not2, label %43, label %35

43:                                               ; preds = %37
  %44 = icmp ugt i64 %.ph3, 65535
  br i1 %44, label %45, label %49

45:                                               ; preds = %43
  tail call void @"0x5632e860b8d0"(ptr %.ph, i64 %.ph3)
  tail call void @"0x5632e860bd70"(ptr %.ph, i64 %6)
  tail call void @"0x5632e860ba40"(ptr %.ph, i64 %7)
  tail call void @"0x5632e860bab0"(ptr %.ph, i64 %9)
  tail call void @"0x5632e860be50"(ptr %.ph, i64 %8)
  %46 = tail call ptr @"0x5632e8303a00"(ptr %0, i64 1)
  tail call void @"0x5632e82f1ac0"(ptr %46, i1 false, i64 %10, i1 %11, ptr %.ph)
  tail call void @"0x5632e8303610"(ptr %0, ptr %.ph)
  %47 = tail call ptr @"0x5632e8303a80"(ptr %0)
  %48 = tail call ptr @"0x5632e860b950"(ptr %47)
  br label %49

49:                                               ; preds = %45, %43
  %50 = phi ptr [ %47, %45 ], [ %.ph, %43 ]
  %51 = phi i64 [ 0, %45 ], [ %.ph3, %43 ]
  %52 = tail call ptr @"0x5632e860b950"(ptr %50)
  %53 = shl nuw nsw i64 %51, 2
  %54 = getelementptr i8, ptr %52, i64 %53
  store i32 %40, ptr %54, align 4
  %55 = add nuw nsw i64 %51, 1
  br label %.outer

56:                                               ; preds = %35
  %57 = tail call i1 @"0x5632e85f3cf0"(ptr %1, ptr nonnull inttoptr (i64 139775080189304 to ptr), ptr %2)
  br i1 %57, label %58, label %29

58:                                               ; preds = %56
  %59 = getelementptr i8, ptr %80, i64 120
  %60 = tail call i64 @"0x5632e8604710"(i32 0, ptr %59, ptr nonnull inttoptr (i64 139775080189312 to ptr))
  %61 = tail call i32 @"0x5632e8602db0"(i32 1, ptr %59, ptr nonnull inttoptr (i64 139775080189312 to ptr))
  %62 = tail call i32 @"0x5632e8602db0"(i32 2, ptr %59, ptr nonnull inttoptr (i64 139775080189312 to ptr))
  %63 = tail call double @"0x5632e8605480"(i32 3, ptr %59, ptr nonnull inttoptr (i64 139775080189312 to ptr))
  tail call void @"0x5632e85f2370"(ptr %59)
  %.not1 = icmp eq i64 %60, 1746560847870
  br i1 %.not1, label %64, label %29

64:                                               ; preds = %58
  %65 = icmp ugt i64 %.ph3, 65535
  br i1 %65, label %66, label %70

66:                                               ; preds = %64
  tail call void @"0x5632e860b8d0"(ptr %.ph, i64 %.ph3)
  tail call void @"0x5632e860bd70"(ptr %.ph, i64 %6)
  tail call void @"0x5632e860ba40"(ptr %.ph, i64 %7)
  tail call void @"0x5632e860bab0"(ptr %.ph, i64 %9)
  tail call void @"0x5632e860be50"(ptr %.ph, i64 %8)
  %67 = tail call ptr @"0x5632e8303a00"(ptr %0, i64 1)
  tail call void @"0x5632e82f1ac0"(ptr %67, i1 false, i64 %10, i1 %11, ptr %.ph)
  tail call void @"0x5632e8303610"(ptr %0, ptr %.ph)
  %68 = tail call ptr @"0x5632e8303a80"(ptr %0)
  %69 = tail call ptr @"0x5632e860b950"(ptr %68)
  br label %70

70:                                               ; preds = %66, %64
  %71 = phi ptr [ %68, %66 ], [ %.ph, %64 ]
  %72 = phi i64 [ 0, %66 ], [ %.ph3, %64 ]
  %73 = tail call ptr @"0x5632e860b950"(ptr %71)
  %74 = shl nuw nsw i64 %72, 2
  %75 = getelementptr i8, ptr %73, i64 %74
  store i32 %61, ptr %75, align 4
  %76 = add nuw nsw i64 %72, 1
  br label %29

77:                                               ; preds = %3
  %78 = tail call ptr @"0x5632e8303a80"(ptr %0)
  %79 = tail call ptr @"0x5632e860b950"(ptr %78)
  %80 = tail call ptr @"0x5632e85f0910"()
  %81 = getelementptr i8, ptr %80, i64 32
  %82 = load i1, ptr %81, align 1
  br i1 %82, label %17, label %25
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
