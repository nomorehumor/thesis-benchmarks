; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: memory(readwrite, errnomem: none)
declare i32 @"0x5593da28a4e0"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x5593da28a510"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i64 @"0x5593da592d00"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i64 @"0x5593da5929d0"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i64 @"0x5593da592e20"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i64 @"0x5593da592df0"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i64 @"0x5593da592ba0"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i1 @"0x5593da592c90"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x5593da4df9e0"(ptr, ptr, ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x5593da2a1f60"(ptr, ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x5593da28aa80"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x5593da592950"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x5593da4d77a0"() local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x5593da4d98d0"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i64 @"0x5593da4f1390"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i32 @"0x5593da4ef950"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare double @"0x5593da4f1b80"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x5593da5928d0"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x5593da592d70"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x5593da592a40"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x5593da592ab0"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x5593da592e50"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x5593da28aa00"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x5593da278ac0"(ptr, i1, i64, i1, ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x5593da28a610"(ptr, ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i1 @"0x5593da4dc200"(ptr, ptr, ptr) local_unnamed_addr #0

define void @execute(ptr %0, ptr %1, ptr %2) local_unnamed_addr #1 {
  %4 = tail call i32 @"0x5593da28a4e0"(ptr %0)
  %5 = tail call ptr @"0x5593da28a510"(ptr %0)
  %6 = tail call i64 @"0x5593da592d00"(ptr %1)
  %7 = tail call i64 @"0x5593da5929d0"(ptr %1)
  %8 = tail call i64 @"0x5593da592e20"(ptr %1)
  %9 = tail call i64 @"0x5593da592df0"(ptr %1)
  %10 = tail call i64 @"0x5593da592ba0"(ptr %1)
  %11 = tail call i1 @"0x5593da592c90"(ptr %1)
  %12 = tail call ptr @"0x5593da4df9e0"(ptr %1, ptr nonnull inttoptr (i64 139941845712200 to ptr), ptr %2)
  %13 = getelementptr i8, ptr %12, i64 34
  %14 = load i1, ptr %13, align 1
  br i1 %14, label %15, label %184

15:                                               ; preds = %3
  tail call void @"0x5593da2a1f60"(ptr %0, ptr %1)
  br label %16

16:                                               ; preds = %15, %62
  ret void

17:                                               ; preds = %184
  %18 = getelementptr i8, ptr %187, i64 48
  %19 = load ptr, ptr %187, align 8
  %20 = tail call ptr @"0x5593da4d98d0"(ptr %18)
  %21 = getelementptr i8, ptr %20, i64 4
  %22 = load i32, ptr %20, align 4
  %23 = load i32, ptr %21, align 4
  %24 = sub i32 %23, %22
  %25 = zext i32 %24 to i64
  %26 = add nsw i64 %25, -1
  %27 = zext i32 %22 to i64
  %28 = getelementptr i8, ptr %19, i64 %27
  %29 = tail call i64 @"0x5593da4f1390"(ptr %28, i64 %26)
  %30 = getelementptr i8, ptr %20, i64 8
  %31 = load i32, ptr %21, align 4
  %32 = load i32, ptr %30, align 4
  %33 = sub i32 %32, %31
  %34 = zext i32 %33 to i64
  %35 = add nsw i64 %34, -1
  %36 = zext i32 %31 to i64
  %37 = getelementptr i8, ptr %19, i64 %36
  %38 = tail call i32 @"0x5593da4ef950"(ptr %37, i64 %35)
  %39 = getelementptr i8, ptr %20, i64 12
  %40 = load i32, ptr %30, align 4
  %41 = load i32, ptr %39, align 4
  %42 = sub i32 %41, %40
  %43 = zext i32 %42 to i64
  %44 = add nsw i64 %43, -1
  %45 = zext i32 %40 to i64
  %46 = getelementptr i8, ptr %19, i64 %45
  %47 = tail call i32 @"0x5593da4ef950"(ptr %46, i64 %44)
  %48 = getelementptr i8, ptr %20, i64 16
  %49 = load i32, ptr %39, align 4
  %50 = load i32, ptr %48, align 4
  %51 = sub i32 %50, %49
  %52 = zext i32 %51 to i64
  %53 = zext i32 %49 to i64
  %54 = getelementptr i8, ptr %19, i64 %53
  %55 = tail call double @"0x5593da4f1b80"(ptr %54, i64 %52)
  %.not = icmp eq i64 %29, 1746560847870
  br i1 %.not, label %56, label %58

56:                                               ; preds = %17
  %57 = tail call ptr @"0x5593da592950"(ptr %185)
  store i32 %38, ptr %57, align 4
  br label %58

58:                                               ; preds = %56, %17, %184
  %59 = phi i64 [ 1, %56 ], [ 0, %17 ], [ 0, %184 ]
  %60 = getelementptr i8, ptr %187, i64 33
  %61 = load i1, ptr %60, align 1
  br i1 %61, label %66, label %62

62:                                               ; preds = %177, %131, %.outer._crit_edge, %58
  %63 = phi ptr [ %178, %177 ], [ %.ph.lcssa, %131 ], [ %.ph.lcssa, %.outer._crit_edge ], [ %185, %58 ]
  %64 = phi i64 [ %183, %177 ], [ %.ph4.lcssa, %131 ], [ %.ph4.lcssa, %.outer._crit_edge ], [ %59, %58 ]
  tail call void @"0x5593da5928d0"(ptr %63, i64 %64)
  tail call void @"0x5593da592d70"(ptr %63, i64 %6)
  tail call void @"0x5593da592a40"(ptr %63, i64 %7)
  tail call void @"0x5593da592ab0"(ptr %63, i64 %9)
  tail call void @"0x5593da592e50"(ptr %63, i64 %8)
  %65 = tail call ptr @"0x5593da28aa00"(ptr %0, i64 1)
  tail call void @"0x5593da278ac0"(ptr %65, i1 true, i64 %10, i1 %11, ptr %63)
  tail call void @"0x5593da28a610"(ptr %0, ptr %63)
  br label %16

66:                                               ; preds = %58
  %67 = getelementptr i8, ptr %187, i64 176
  %68 = getelementptr i8, ptr %187, i64 200
  %69 = load i64, ptr %68, align 4
  %.not16 = icmp eq i64 %69, 0
  br i1 %.not16, label %.outer._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %66, %.outer
  %.ph513 = phi i64 [ %123, %.outer ], [ 0, %66 ]
  %.ph412 = phi i64 [ %122, %.outer ], [ %59, %66 ]
  %.ph11 = phi ptr [ %117, %.outer ], [ %185, %66 ]
  br label %70

70:                                               ; preds = %.lr.ph, %126
  %71 = phi i64 [ %.ph513, %.lr.ph ], [ %127, %126 ]
  %72 = tail call ptr @"0x5593da592950"(ptr %1)
  %73 = tail call ptr @"0x5593da4d98d0"(ptr %67)
  %74 = mul i64 %71, 20
  %75 = getelementptr i8, ptr %73, i64 %74
  %76 = getelementptr i8, ptr %75, i64 4
  %77 = load i32, ptr %75, align 4
  %78 = load i32, ptr %76, align 4
  %79 = sub i32 %78, %77
  %80 = zext i32 %79 to i64
  %81 = add nsw i64 %80, -1
  %82 = zext i32 %77 to i64
  %83 = getelementptr i8, ptr %72, i64 %82
  %84 = tail call i64 @"0x5593da4f1390"(ptr %83, i64 %81)
  %85 = getelementptr i8, ptr %75, i64 8
  %86 = load i32, ptr %76, align 4
  %87 = load i32, ptr %85, align 4
  %88 = sub i32 %87, %86
  %89 = zext i32 %88 to i64
  %90 = add nsw i64 %89, -1
  %91 = zext i32 %86 to i64
  %92 = getelementptr i8, ptr %72, i64 %91
  %93 = tail call i32 @"0x5593da4ef950"(ptr %92, i64 %90)
  %94 = getelementptr i8, ptr %75, i64 12
  %95 = load i32, ptr %85, align 4
  %96 = load i32, ptr %94, align 4
  %97 = sub i32 %96, %95
  %98 = zext i32 %97 to i64
  %99 = add nsw i64 %98, -1
  %100 = zext i32 %95 to i64
  %101 = getelementptr i8, ptr %72, i64 %100
  %102 = tail call i32 @"0x5593da4ef950"(ptr %101, i64 %99)
  %103 = getelementptr i8, ptr %75, i64 16
  %104 = load i32, ptr %94, align 4
  %105 = load i32, ptr %103, align 4
  %106 = sub i32 %105, %104
  %107 = zext i32 %106 to i64
  %108 = zext i32 %104 to i64
  %109 = getelementptr i8, ptr %72, i64 %108
  %110 = tail call double @"0x5593da4f1b80"(ptr %109, i64 %107)
  %.not3 = icmp eq i64 %84, 1746560847870
  br i1 %.not3, label %111, label %126

111:                                              ; preds = %70
  %112 = icmp ugt i64 %.ph412, 65535
  br i1 %112, label %113, label %.outer

113:                                              ; preds = %111
  tail call void @"0x5593da5928d0"(ptr %.ph11, i64 %.ph412)
  tail call void @"0x5593da592d70"(ptr %.ph11, i64 %6)
  tail call void @"0x5593da592a40"(ptr %.ph11, i64 %7)
  tail call void @"0x5593da592ab0"(ptr %.ph11, i64 %9)
  tail call void @"0x5593da592e50"(ptr %.ph11, i64 %8)
  %114 = tail call ptr @"0x5593da28aa00"(ptr %0, i64 1)
  tail call void @"0x5593da278ac0"(ptr %114, i1 false, i64 %10, i1 %11, ptr %.ph11)
  tail call void @"0x5593da28a610"(ptr %0, ptr %.ph11)
  %115 = tail call ptr @"0x5593da28aa80"(ptr %0)
  %116 = tail call ptr @"0x5593da592950"(ptr %115)
  br label %.outer

.outer:                                           ; preds = %113, %111
  %117 = phi ptr [ %115, %113 ], [ %.ph11, %111 ]
  %118 = phi i64 [ 0, %113 ], [ %.ph412, %111 ]
  %119 = tail call ptr @"0x5593da592950"(ptr %117)
  %120 = shl nuw nsw i64 %118, 2
  %121 = getelementptr i8, ptr %119, i64 %120
  store i32 %93, ptr %121, align 4
  %122 = add nuw nsw i64 %118, 1
  %123 = add nuw i64 %71, 1
  %124 = load i64, ptr %68, align 4
  %125 = icmp ult i64 %123, %124
  br i1 %125, label %.lr.ph, label %.outer._crit_edge

126:                                              ; preds = %70
  %127 = add nuw i64 %71, 1
  %128 = load i64, ptr %68, align 4
  %129 = icmp ult i64 %127, %128
  br i1 %129, label %70, label %.outer._crit_edge

.outer._crit_edge:                                ; preds = %.outer, %126, %66
  %.ph.lcssa = phi ptr [ %185, %66 ], [ %.ph11, %126 ], [ %117, %.outer ]
  %.ph4.lcssa = phi i64 [ %59, %66 ], [ %.ph412, %126 ], [ %122, %.outer ]
  %130 = tail call i1 @"0x5593da4dc200"(ptr %1, ptr nonnull inttoptr (i64 139941845712200 to ptr), ptr %2)
  br i1 %130, label %131, label %62

131:                                              ; preds = %.outer._crit_edge
  %132 = getelementptr i8, ptr %187, i64 112
  %133 = getelementptr i8, ptr %187, i64 16
  %134 = load ptr, ptr %133, align 8
  %135 = tail call ptr @"0x5593da4d98d0"(ptr %132)
  %136 = getelementptr i8, ptr %135, i64 4
  %137 = load i32, ptr %135, align 4
  %138 = load i32, ptr %136, align 4
  %139 = sub i32 %138, %137
  %140 = zext i32 %139 to i64
  %141 = add nsw i64 %140, -1
  %142 = zext i32 %137 to i64
  %143 = getelementptr i8, ptr %134, i64 %142
  %144 = tail call i64 @"0x5593da4f1390"(ptr %143, i64 %141)
  %145 = getelementptr i8, ptr %135, i64 8
  %146 = load i32, ptr %136, align 4
  %147 = load i32, ptr %145, align 4
  %148 = sub i32 %147, %146
  %149 = zext i32 %148 to i64
  %150 = add nsw i64 %149, -1
  %151 = zext i32 %146 to i64
  %152 = getelementptr i8, ptr %134, i64 %151
  %153 = tail call i32 @"0x5593da4ef950"(ptr %152, i64 %150)
  %154 = getelementptr i8, ptr %135, i64 12
  %155 = load i32, ptr %145, align 4
  %156 = load i32, ptr %154, align 4
  %157 = sub i32 %156, %155
  %158 = zext i32 %157 to i64
  %159 = add nsw i64 %158, -1
  %160 = zext i32 %155 to i64
  %161 = getelementptr i8, ptr %134, i64 %160
  %162 = tail call i32 @"0x5593da4ef950"(ptr %161, i64 %159)
  %163 = getelementptr i8, ptr %135, i64 16
  %164 = load i32, ptr %154, align 4
  %165 = load i32, ptr %163, align 4
  %166 = sub i32 %165, %164
  %167 = zext i32 %166 to i64
  %168 = zext i32 %164 to i64
  %169 = getelementptr i8, ptr %134, i64 %168
  %170 = tail call double @"0x5593da4f1b80"(ptr %169, i64 %167)
  %.not2 = icmp eq i64 %144, 1746560847870
  br i1 %.not2, label %171, label %62

171:                                              ; preds = %131
  %172 = icmp ugt i64 %.ph4.lcssa, 65535
  br i1 %172, label %173, label %177

173:                                              ; preds = %171
  tail call void @"0x5593da5928d0"(ptr %.ph.lcssa, i64 %.ph4.lcssa)
  tail call void @"0x5593da592d70"(ptr %.ph.lcssa, i64 %6)
  tail call void @"0x5593da592a40"(ptr %.ph.lcssa, i64 %7)
  tail call void @"0x5593da592ab0"(ptr %.ph.lcssa, i64 %9)
  tail call void @"0x5593da592e50"(ptr %.ph.lcssa, i64 %8)
  %174 = tail call ptr @"0x5593da28aa00"(ptr %0, i64 1)
  tail call void @"0x5593da278ac0"(ptr %174, i1 false, i64 %10, i1 %11, ptr %.ph.lcssa)
  tail call void @"0x5593da28a610"(ptr %0, ptr %.ph.lcssa)
  %175 = tail call ptr @"0x5593da28aa80"(ptr %0)
  %176 = tail call ptr @"0x5593da592950"(ptr %175)
  br label %177

177:                                              ; preds = %173, %171
  %178 = phi ptr [ %175, %173 ], [ %.ph.lcssa, %171 ]
  %179 = phi i64 [ 0, %173 ], [ %.ph4.lcssa, %171 ]
  %180 = tail call ptr @"0x5593da592950"(ptr %178)
  %181 = shl nuw nsw i64 %179, 2
  %182 = getelementptr i8, ptr %180, i64 %181
  store i32 %153, ptr %182, align 4
  %183 = add nuw nsw i64 %179, 1
  br label %62

184:                                              ; preds = %3
  %185 = tail call ptr @"0x5593da28aa80"(ptr %0)
  %186 = tail call ptr @"0x5593da592950"(ptr %185)
  %187 = tail call ptr @"0x5593da4d77a0"()
  %188 = getelementptr i8, ptr %187, i64 32
  %189 = load i1, ptr %188, align 1
  br i1 %189, label %17, label %58
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
