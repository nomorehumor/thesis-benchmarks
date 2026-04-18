; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: memory(readwrite, errnomem: none)
declare i32 @"0x560766447cb0"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x560766447ce0"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i64 @"0x5607666d0bb0"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i64 @"0x5607666d0880"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i64 @"0x5607666d0cd0"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i64 @"0x5607666d0ca0"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i64 @"0x5607666d0a50"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i1 @"0x5607666d0b40"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x56076661d8f0"(ptr, ptr, ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x5607664604a0"(ptr, ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x560766448250"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x5607666d0800"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x560766615780"() local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x560766617880"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i32 @"0x56076662d870"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i64 @"0x56076662f290"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x5607666d0780"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x5607666d0c20"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x5607666d08f0"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x5607666d0960"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x5607666d0d00"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x5607664481d0"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x5607664358f0"(ptr, i1, i64, i1, ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x560766447de0"(ptr, ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x5607666da080"(ptr, ptr, ptr, i64, ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i1 @"0x56076661a110"(ptr, ptr, ptr) local_unnamed_addr #0

define void @execute(ptr %0, ptr %1, ptr %2) local_unnamed_addr #1 {
  %4 = tail call i32 @"0x560766447cb0"(ptr %0)
  %5 = tail call ptr @"0x560766447ce0"(ptr %0)
  %6 = tail call i64 @"0x5607666d0bb0"(ptr %1)
  %7 = tail call i64 @"0x5607666d0880"(ptr %1)
  %8 = tail call i64 @"0x5607666d0cd0"(ptr %1)
  %9 = tail call i64 @"0x5607666d0ca0"(ptr %1)
  %10 = tail call i64 @"0x5607666d0a50"(ptr %1)
  %11 = tail call i1 @"0x5607666d0b40"(ptr %1)
  %12 = tail call ptr @"0x56076661d8f0"(ptr %1, ptr nonnull inttoptr (i64 140214374774200 to ptr), ptr %2)
  %13 = getelementptr i8, ptr %12, i64 34
  %14 = load i1, ptr %13, align 1
  br i1 %14, label %15, label %158

15:                                               ; preds = %3
  tail call void @"0x5607664604a0"(ptr %0, ptr %1)
  br label %16

16:                                               ; preds = %15, %54
  ret void

17:                                               ; preds = %158
  %18 = getelementptr i8, ptr %161, i64 48
  %19 = load ptr, ptr %161, align 8
  %20 = tail call ptr @"0x560766617880"(ptr %18)
  %21 = getelementptr i8, ptr %20, i64 4
  %22 = load i32, ptr %20, align 4
  %23 = load i32, ptr %21, align 4
  %24 = sub i32 %23, %22
  %25 = zext i32 %24 to i64
  %26 = add nsw i64 %25, -1
  %27 = zext i32 %22 to i64
  %28 = getelementptr i8, ptr %19, i64 %27
  %29 = tail call i32 @"0x56076662d870"(ptr %28, i64 %26)
  %30 = getelementptr i8, ptr %20, i64 12
  %31 = getelementptr i8, ptr %20, i64 16
  %32 = load i32, ptr %30, align 4
  %33 = load i32, ptr %31, align 4
  %34 = getelementptr i8, ptr %20, i64 24
  %35 = getelementptr i8, ptr %20, i64 28
  %36 = load i32, ptr %34, align 4
  %37 = load i32, ptr %35, align 4
  %38 = sub i32 %37, %36
  %39 = zext i32 %38 to i64
  %40 = add nsw i64 %39, -1
  %41 = zext i32 %36 to i64
  %42 = getelementptr i8, ptr %19, i64 %41
  %43 = tail call i64 @"0x56076662f290"(ptr %42, i64 %40)
  %44 = zext i32 %32 to i64
  %45 = getelementptr i8, ptr %19, i64 %44
  %46 = sub i32 %33, %32
  %47 = zext i32 %46 to i64
  %48 = add nsw i64 %47, -1
  %49 = tail call ptr @"0x5607666d0800"(ptr %159)
  tail call void @"0x5607666da080"(ptr %159, ptr %5, ptr %45, i64 %48, ptr %49)
  br label %50

50:                                               ; preds = %17, %158
  %51 = phi i64 [ 1, %17 ], [ 0, %158 ]
  %52 = getelementptr i8, ptr %161, i64 33
  %53 = load i1, ptr %52, align 1
  br i1 %53, label %58, label %54

54:                                               ; preds = %151, %._crit_edge, %50
  %55 = phi ptr [ %152, %151 ], [ %.lcssa2, %._crit_edge ], [ %159, %50 ]
  %56 = phi i64 [ %157, %151 ], [ %.lcssa, %._crit_edge ], [ %51, %50 ]
  tail call void @"0x5607666d0780"(ptr %55, i64 %56)
  tail call void @"0x5607666d0c20"(ptr %55, i64 %6)
  tail call void @"0x5607666d08f0"(ptr %55, i64 %7)
  tail call void @"0x5607666d0960"(ptr %55, i64 %9)
  tail call void @"0x5607666d0d00"(ptr %55, i64 %8)
  %57 = tail call ptr @"0x5607664481d0"(ptr %0, i64 1)
  tail call void @"0x5607664358f0"(ptr %57, i1 true, i64 %10, i1 %11, ptr %55)
  tail call void @"0x560766447de0"(ptr %0, ptr %55)
  br label %16

58:                                               ; preds = %50
  %59 = getelementptr i8, ptr %161, i64 176
  %60 = getelementptr i8, ptr %161, i64 200
  %61 = load i64, ptr %60, align 4
  %.not = icmp eq i64 %61, 0
  br i1 %.not, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %58, %102
  %62 = phi i64 [ %109, %102 ], [ 0, %58 ]
  %63 = phi i64 [ %108, %102 ], [ %51, %58 ]
  %64 = phi ptr [ %103, %102 ], [ %159, %58 ]
  %65 = tail call ptr @"0x5607666d0800"(ptr %1)
  %66 = tail call ptr @"0x560766617880"(ptr %59)
  %67 = mul i64 %62, 36
  %68 = getelementptr i8, ptr %66, i64 %67
  %69 = getelementptr i8, ptr %68, i64 4
  %70 = load i32, ptr %68, align 4
  %71 = load i32, ptr %69, align 4
  %72 = sub i32 %71, %70
  %73 = zext i32 %72 to i64
  %74 = add nsw i64 %73, -1
  %75 = zext i32 %70 to i64
  %76 = getelementptr i8, ptr %65, i64 %75
  %77 = tail call i32 @"0x56076662d870"(ptr %76, i64 %74)
  %78 = getelementptr i8, ptr %68, i64 12
  %79 = getelementptr i8, ptr %68, i64 16
  %80 = load i32, ptr %78, align 4
  %81 = load i32, ptr %79, align 4
  %82 = sub i32 %81, %80
  %83 = zext i32 %82 to i64
  %84 = add nsw i64 %83, -1
  %85 = zext i32 %80 to i64
  %86 = getelementptr i8, ptr %65, i64 %85
  %87 = getelementptr i8, ptr %68, i64 24
  %88 = getelementptr i8, ptr %68, i64 28
  %89 = load i32, ptr %87, align 4
  %90 = load i32, ptr %88, align 4
  %91 = sub i32 %90, %89
  %92 = zext i32 %91 to i64
  %93 = add nsw i64 %92, -1
  %94 = zext i32 %89 to i64
  %95 = getelementptr i8, ptr %65, i64 %94
  %96 = tail call i64 @"0x56076662f290"(ptr %95, i64 %93)
  %97 = icmp ugt i64 %63, 16383
  br i1 %97, label %98, label %102

98:                                               ; preds = %.lr.ph
  tail call void @"0x5607666d0780"(ptr %64, i64 %63)
  tail call void @"0x5607666d0c20"(ptr %64, i64 %6)
  tail call void @"0x5607666d08f0"(ptr %64, i64 %7)
  tail call void @"0x5607666d0960"(ptr %64, i64 %9)
  tail call void @"0x5607666d0d00"(ptr %64, i64 %8)
  %99 = tail call ptr @"0x5607664481d0"(ptr %0, i64 1)
  tail call void @"0x5607664358f0"(ptr %99, i1 false, i64 %10, i1 %11, ptr %64)
  tail call void @"0x560766447de0"(ptr %0, ptr %64)
  %100 = tail call ptr @"0x560766448250"(ptr %0)
  %101 = tail call ptr @"0x5607666d0800"(ptr %100)
  br label %102

102:                                              ; preds = %98, %.lr.ph
  %103 = phi ptr [ %100, %98 ], [ %64, %.lr.ph ]
  %104 = phi i64 [ 0, %98 ], [ %63, %.lr.ph ]
  %105 = tail call ptr @"0x5607666d0800"(ptr %103)
  %106 = shl nuw nsw i64 %104, 4
  %107 = getelementptr i8, ptr %105, i64 %106
  tail call void @"0x5607666da080"(ptr %103, ptr %5, ptr %86, i64 %84, ptr %107)
  %108 = add nuw nsw i64 %104, 1
  %109 = add nuw i64 %62, 1
  %110 = load i64, ptr %60, align 4
  %111 = icmp ult i64 %109, %110
  br i1 %111, label %.lr.ph, label %._crit_edge

._crit_edge:                                      ; preds = %102, %58
  %.lcssa2 = phi ptr [ %159, %58 ], [ %103, %102 ]
  %.lcssa = phi i64 [ %51, %58 ], [ %108, %102 ]
  %112 = tail call i1 @"0x56076661a110"(ptr %1, ptr nonnull inttoptr (i64 140214374774200 to ptr), ptr %2)
  br i1 %112, label %113, label %54

113:                                              ; preds = %._crit_edge
  %114 = getelementptr i8, ptr %161, i64 112
  %115 = getelementptr i8, ptr %161, i64 16
  %116 = load ptr, ptr %115, align 8
  %117 = tail call ptr @"0x560766617880"(ptr %114)
  %118 = getelementptr i8, ptr %117, i64 4
  %119 = load i32, ptr %117, align 4
  %120 = load i32, ptr %118, align 4
  %121 = sub i32 %120, %119
  %122 = zext i32 %121 to i64
  %123 = add nsw i64 %122, -1
  %124 = zext i32 %119 to i64
  %125 = getelementptr i8, ptr %116, i64 %124
  %126 = tail call i32 @"0x56076662d870"(ptr %125, i64 %123)
  %127 = getelementptr i8, ptr %117, i64 12
  %128 = getelementptr i8, ptr %117, i64 16
  %129 = load i32, ptr %127, align 4
  %130 = load i32, ptr %128, align 4
  %131 = sub i32 %130, %129
  %132 = zext i32 %131 to i64
  %133 = add nsw i64 %132, -1
  %134 = zext i32 %129 to i64
  %135 = getelementptr i8, ptr %116, i64 %134
  %136 = getelementptr i8, ptr %117, i64 24
  %137 = getelementptr i8, ptr %117, i64 28
  %138 = load i32, ptr %136, align 4
  %139 = load i32, ptr %137, align 4
  %140 = sub i32 %139, %138
  %141 = zext i32 %140 to i64
  %142 = add nsw i64 %141, -1
  %143 = zext i32 %138 to i64
  %144 = getelementptr i8, ptr %116, i64 %143
  %145 = tail call i64 @"0x56076662f290"(ptr %144, i64 %142)
  %146 = icmp samesign ugt i64 %.lcssa, 16383
  br i1 %146, label %147, label %151

147:                                              ; preds = %113
  tail call void @"0x5607666d0780"(ptr %.lcssa2, i64 %.lcssa)
  tail call void @"0x5607666d0c20"(ptr %.lcssa2, i64 %6)
  tail call void @"0x5607666d08f0"(ptr %.lcssa2, i64 %7)
  tail call void @"0x5607666d0960"(ptr %.lcssa2, i64 %9)
  tail call void @"0x5607666d0d00"(ptr %.lcssa2, i64 %8)
  %148 = tail call ptr @"0x5607664481d0"(ptr %0, i64 1)
  tail call void @"0x5607664358f0"(ptr %148, i1 false, i64 %10, i1 %11, ptr %.lcssa2)
  tail call void @"0x560766447de0"(ptr %0, ptr %.lcssa2)
  %149 = tail call ptr @"0x560766448250"(ptr %0)
  %150 = tail call ptr @"0x5607666d0800"(ptr %149)
  br label %151

151:                                              ; preds = %147, %113
  %152 = phi ptr [ %149, %147 ], [ %.lcssa2, %113 ]
  %153 = phi i64 [ 0, %147 ], [ %.lcssa, %113 ]
  %154 = tail call ptr @"0x5607666d0800"(ptr %152)
  %155 = shl nuw nsw i64 %153, 4
  %156 = getelementptr i8, ptr %154, i64 %155
  tail call void @"0x5607666da080"(ptr %152, ptr %5, ptr %135, i64 %133, ptr %156)
  %157 = add nuw nsw i64 %153, 1
  br label %54

158:                                              ; preds = %3
  %159 = tail call ptr @"0x560766448250"(ptr %0)
  %160 = tail call ptr @"0x5607666d0800"(ptr %159)
  %161 = tail call ptr @"0x560766615780"()
  %162 = getelementptr i8, ptr %161, i64 32
  %163 = load i1, ptr %162, align 1
  br i1 %163, label %17, label %50
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
