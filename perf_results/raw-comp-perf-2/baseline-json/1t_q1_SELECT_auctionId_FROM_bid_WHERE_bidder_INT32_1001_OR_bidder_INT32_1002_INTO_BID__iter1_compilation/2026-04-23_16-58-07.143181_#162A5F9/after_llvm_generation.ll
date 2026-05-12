; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: memory(readwrite, errnomem: none)
declare i32 @"0x55eb41eae4e0"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x55eb41eae510"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i64 @"0x55eb421b6d00"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i64 @"0x55eb421b69d0"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i64 @"0x55eb421b6e20"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i64 @"0x55eb421b6df0"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i64 @"0x55eb421b6ba0"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i1 @"0x55eb421b6c90"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x55eb421a0000"(ptr, ptr, ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x55eb41ec5f60"(ptr, ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x55eb41eaea80"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x55eb421b6950"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x55eb4219b910"() local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i64 @"0x55eb421af710"(i32, ptr, ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i32 @"0x55eb421addb0"(i32, ptr, ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare double @"0x55eb421b0480"(i32, ptr, ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x55eb4219d370"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x55eb421b68d0"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x55eb421b6d70"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x55eb421b6a40"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x55eb421b6ab0"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x55eb421b6e50"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x55eb41eaea00"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x55eb41e9cac0"(ptr, i1, i64, i1, ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x55eb41eae610"(ptr, ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i1 @"0x55eb4219ecf0"(ptr, ptr, ptr) local_unnamed_addr #0

define void @execute(ptr %0, ptr %1, ptr %2) local_unnamed_addr #1 {
  %4 = tail call i32 @"0x55eb41eae4e0"(ptr %0)
  %5 = tail call ptr @"0x55eb41eae510"(ptr %0)
  %6 = tail call i64 @"0x55eb421b6d00"(ptr %1)
  %7 = tail call i64 @"0x55eb421b69d0"(ptr %1)
  %8 = tail call i64 @"0x55eb421b6e20"(ptr %1)
  %9 = tail call i64 @"0x55eb421b6df0"(ptr %1)
  %10 = tail call i64 @"0x55eb421b6ba0"(ptr %1)
  %11 = tail call i1 @"0x55eb421b6c90"(ptr %1)
  %12 = tail call ptr @"0x55eb421a0000"(ptr %1, ptr nonnull inttoptr (i64 140120690834568 to ptr), ptr %2)
  %13 = getelementptr i8, ptr %12, i64 34
  %14 = load i1, ptr %13, align 1
  br i1 %14, label %15, label %83

15:                                               ; preds = %3
  tail call void @"0x55eb41ec5f60"(ptr %0, ptr %1)
  br label %16

16:                                               ; preds = %15, %31
  ret void

17:                                               ; preds = %83
  %18 = getelementptr i8, ptr %86, i64 48
  %19 = tail call i64 @"0x55eb421af710"(i32 0, ptr %18, ptr nonnull inttoptr (i64 140120690834576 to ptr))
  %20 = tail call i32 @"0x55eb421addb0"(i32 1, ptr %18, ptr nonnull inttoptr (i64 140120690834576 to ptr))
  %21 = tail call i32 @"0x55eb421addb0"(i32 2, ptr %18, ptr nonnull inttoptr (i64 140120690834576 to ptr))
  %22 = tail call double @"0x55eb421b0480"(i32 3, ptr %18, ptr nonnull inttoptr (i64 140120690834576 to ptr))
  tail call void @"0x55eb4219d370"(ptr %18)
  %23 = add i32 %21, -1001
  %24 = icmp ult i32 %23, 2
  br i1 %24, label %25, label %27

25:                                               ; preds = %17
  %26 = tail call ptr @"0x55eb421b6950"(ptr %84)
  store i32 %20, ptr %26, align 4
  br label %27

27:                                               ; preds = %25, %17, %83
  %28 = phi i64 [ 1, %25 ], [ 0, %17 ], [ 0, %83 ]
  %29 = getelementptr i8, ptr %86, i64 33
  %30 = load i1, ptr %29, align 1
  br i1 %30, label %35, label %31

31:                                               ; preds = %76, %62, %60, %27
  %32 = phi ptr [ %77, %76 ], [ %.ph, %62 ], [ %.ph, %60 ], [ %84, %27 ]
  %33 = phi i64 [ %82, %76 ], [ %.ph1, %62 ], [ %.ph1, %60 ], [ %28, %27 ]
  tail call void @"0x55eb421b68d0"(ptr %32, i64 %33)
  tail call void @"0x55eb421b6d70"(ptr %32, i64 %6)
  tail call void @"0x55eb421b6a40"(ptr %32, i64 %7)
  tail call void @"0x55eb421b6ab0"(ptr %32, i64 %9)
  tail call void @"0x55eb421b6e50"(ptr %32, i64 %8)
  %34 = tail call ptr @"0x55eb41eaea00"(ptr %0, i64 1)
  tail call void @"0x55eb41e9cac0"(ptr %34, i1 true, i64 %10, i1 %11, ptr %32)
  tail call void @"0x55eb41eae610"(ptr %0, ptr %32)
  br label %16

35:                                               ; preds = %27
  %36 = getelementptr i8, ptr %86, i64 192
  br label %.outer

.outer:                                           ; preds = %35, %53
  %.ph = phi ptr [ %84, %35 ], [ %54, %53 ]
  %.ph1 = phi i64 [ %28, %35 ], [ %59, %53 ]
  br label %37

37:                                               ; preds = %.outer, %39
  %38 = load i1, ptr %36, align 1
  br i1 %38, label %60, label %39

39:                                               ; preds = %37
  %40 = tail call ptr @"0x55eb421b6950"(ptr %1)
  %41 = tail call i64 @"0x55eb421af710"(i32 0, ptr nonnull %36, ptr nonnull inttoptr (i64 140120690834576 to ptr))
  %42 = tail call i32 @"0x55eb421addb0"(i32 1, ptr nonnull %36, ptr nonnull inttoptr (i64 140120690834576 to ptr))
  %43 = tail call i32 @"0x55eb421addb0"(i32 2, ptr nonnull %36, ptr nonnull inttoptr (i64 140120690834576 to ptr))
  %44 = tail call double @"0x55eb421b0480"(i32 3, ptr nonnull %36, ptr nonnull inttoptr (i64 140120690834576 to ptr))
  tail call void @"0x55eb4219d370"(ptr nonnull %36)
  %45 = add i32 %43, -1001
  %46 = icmp ult i32 %45, 2
  br i1 %46, label %47, label %37

47:                                               ; preds = %39
  %48 = icmp ugt i64 %.ph1, 65535
  br i1 %48, label %49, label %53

49:                                               ; preds = %47
  tail call void @"0x55eb421b68d0"(ptr %.ph, i64 %.ph1)
  tail call void @"0x55eb421b6d70"(ptr %.ph, i64 %6)
  tail call void @"0x55eb421b6a40"(ptr %.ph, i64 %7)
  tail call void @"0x55eb421b6ab0"(ptr %.ph, i64 %9)
  tail call void @"0x55eb421b6e50"(ptr %.ph, i64 %8)
  %50 = tail call ptr @"0x55eb41eaea00"(ptr %0, i64 1)
  tail call void @"0x55eb41e9cac0"(ptr %50, i1 false, i64 %10, i1 %11, ptr %.ph)
  tail call void @"0x55eb41eae610"(ptr %0, ptr %.ph)
  %51 = tail call ptr @"0x55eb41eaea80"(ptr %0)
  %52 = tail call ptr @"0x55eb421b6950"(ptr %51)
  br label %53

53:                                               ; preds = %49, %47
  %54 = phi ptr [ %51, %49 ], [ %.ph, %47 ]
  %55 = phi i64 [ 0, %49 ], [ %.ph1, %47 ]
  %56 = tail call ptr @"0x55eb421b6950"(ptr %54)
  %57 = shl nuw nsw i64 %55, 2
  %58 = getelementptr i8, ptr %56, i64 %57
  store i32 %42, ptr %58, align 4
  %59 = add nuw nsw i64 %55, 1
  br label %.outer

60:                                               ; preds = %37
  %61 = tail call i1 @"0x55eb4219ecf0"(ptr %1, ptr nonnull inttoptr (i64 140120690834568 to ptr), ptr %2)
  br i1 %61, label %62, label %31

62:                                               ; preds = %60
  %63 = getelementptr i8, ptr %86, i64 120
  %64 = tail call i64 @"0x55eb421af710"(i32 0, ptr %63, ptr nonnull inttoptr (i64 140120690834576 to ptr))
  %65 = tail call i32 @"0x55eb421addb0"(i32 1, ptr %63, ptr nonnull inttoptr (i64 140120690834576 to ptr))
  %66 = tail call i32 @"0x55eb421addb0"(i32 2, ptr %63, ptr nonnull inttoptr (i64 140120690834576 to ptr))
  %67 = tail call double @"0x55eb421b0480"(i32 3, ptr %63, ptr nonnull inttoptr (i64 140120690834576 to ptr))
  tail call void @"0x55eb4219d370"(ptr %63)
  %68 = add i32 %66, -1001
  %69 = icmp ult i32 %68, 2
  br i1 %69, label %70, label %31

70:                                               ; preds = %62
  %71 = icmp ugt i64 %.ph1, 65535
  br i1 %71, label %72, label %76

72:                                               ; preds = %70
  tail call void @"0x55eb421b68d0"(ptr %.ph, i64 %.ph1)
  tail call void @"0x55eb421b6d70"(ptr %.ph, i64 %6)
  tail call void @"0x55eb421b6a40"(ptr %.ph, i64 %7)
  tail call void @"0x55eb421b6ab0"(ptr %.ph, i64 %9)
  tail call void @"0x55eb421b6e50"(ptr %.ph, i64 %8)
  %73 = tail call ptr @"0x55eb41eaea00"(ptr %0, i64 1)
  tail call void @"0x55eb41e9cac0"(ptr %73, i1 false, i64 %10, i1 %11, ptr %.ph)
  tail call void @"0x55eb41eae610"(ptr %0, ptr %.ph)
  %74 = tail call ptr @"0x55eb41eaea80"(ptr %0)
  %75 = tail call ptr @"0x55eb421b6950"(ptr %74)
  br label %76

76:                                               ; preds = %72, %70
  %77 = phi ptr [ %74, %72 ], [ %.ph, %70 ]
  %78 = phi i64 [ 0, %72 ], [ %.ph1, %70 ]
  %79 = tail call ptr @"0x55eb421b6950"(ptr %77)
  %80 = shl nuw nsw i64 %78, 2
  %81 = getelementptr i8, ptr %79, i64 %80
  store i32 %65, ptr %81, align 4
  %82 = add nuw nsw i64 %78, 1
  br label %31

83:                                               ; preds = %3
  %84 = tail call ptr @"0x55eb41eaea80"(ptr %0)
  %85 = tail call ptr @"0x55eb421b6950"(ptr %84)
  %86 = tail call ptr @"0x55eb4219b910"()
  %87 = getelementptr i8, ptr %86, i64 32
  %88 = load i1, ptr %87, align 1
  br i1 %88, label %17, label %27
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
