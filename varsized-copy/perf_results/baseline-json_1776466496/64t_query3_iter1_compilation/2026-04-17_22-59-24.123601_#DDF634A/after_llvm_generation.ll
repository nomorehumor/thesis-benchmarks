; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: memory(readwrite, errnomem: none)
declare i32 @"0x56063b153cf0"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x56063b153d20"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i64 @"0x56063b3ddb80"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i64 @"0x56063b3dd850"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i64 @"0x56063b3ddca0"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i64 @"0x56063b3ddc70"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i64 @"0x56063b3dda20"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i1 @"0x56063b3ddb10"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x56063b3c6250"(ptr, ptr, ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x56063b16c4e0"(ptr, ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x56063b154290"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x56063b3dd7d0"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x56063b3c1b40"() local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i32 @"0x56063b3d4c30"(i32, ptr, ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x56063b3c9750"(i32, ptr, ptr, ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i64 @"0x56063b3d6590"(i32, ptr, ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x56063b3c35c0"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x56063b3dd750"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x56063b3ddbf0"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x56063b3dd8c0"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x56063b3dd930"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x56063b3ddcd0"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x56063b154210"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x56063b141930"(ptr, i1, i64, i1, ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x56063b153e20"(ptr, ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x56063b3e7050"(ptr, ptr, ptr, i64, ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i1 @"0x56063b3c4f40"(ptr, ptr, ptr) local_unnamed_addr #0

define void @execute(ptr %0, ptr %1, ptr %2) local_unnamed_addr #1 {
  %4 = tail call i32 @"0x56063b153cf0"(ptr %0)
  %5 = tail call ptr @"0x56063b153d20"(ptr %0)
  %6 = tail call i64 @"0x56063b3ddb80"(ptr %1)
  %7 = tail call i64 @"0x56063b3dd850"(ptr %1)
  %8 = tail call i64 @"0x56063b3ddca0"(ptr %1)
  %9 = tail call i64 @"0x56063b3ddc70"(ptr %1)
  %10 = tail call i64 @"0x56063b3dda20"(ptr %1)
  %11 = tail call i1 @"0x56063b3ddb10"(ptr %1)
  %12 = tail call ptr @"0x56063b3c6250"(ptr %1, ptr nonnull inttoptr (i64 139659116035992 to ptr), ptr %2)
  %13 = getelementptr i8, ptr %12, i64 34
  %14 = load i1, ptr %13, align 1
  br i1 %14, label %15, label %161

15:                                               ; preds = %3
  tail call void @"0x56063b16c4e0"(ptr %0, ptr %1)
  br label %16

16:                                               ; preds = %15, %57
  ret void

17:                                               ; preds = %161
  %18 = getelementptr i8, ptr %164, i64 48
  %19 = tail call i32 @"0x56063b3d4c30"(i32 0, ptr %18, ptr nonnull inttoptr (i64 139659116036000 to ptr))
  %20 = tail call ptr @"0x56063b3c9750"(i32 1, ptr %18, ptr nonnull inttoptr (i64 139659116036000 to ptr), ptr %2)
  %21 = load ptr, ptr %20, align 8
  %22 = getelementptr i8, ptr %20, i64 16
  %23 = load i64, ptr %22, align 4
  %24 = tail call ptr @"0x56063b3c9750"(i32 2, ptr %18, ptr nonnull inttoptr (i64 139659116036000 to ptr), ptr %2)
  %25 = load ptr, ptr %24, align 8
  %26 = getelementptr i8, ptr %24, i64 16
  %27 = load i64, ptr %26, align 4
  %28 = tail call ptr @"0x56063b3c9750"(i32 3, ptr %18, ptr nonnull inttoptr (i64 139659116036000 to ptr), ptr %2)
  %29 = load ptr, ptr %28, align 8
  %30 = getelementptr i8, ptr %28, i64 16
  %31 = load i64, ptr %30, align 4
  %32 = tail call ptr @"0x56063b3c9750"(i32 4, ptr %18, ptr nonnull inttoptr (i64 139659116036000 to ptr), ptr %2)
  %33 = load ptr, ptr %32, align 8
  %34 = getelementptr i8, ptr %32, i64 16
  %35 = load i64, ptr %34, align 4
  %36 = tail call ptr @"0x56063b3c9750"(i32 5, ptr %18, ptr nonnull inttoptr (i64 139659116036000 to ptr), ptr %2)
  %37 = load ptr, ptr %36, align 8
  %38 = getelementptr i8, ptr %36, i64 16
  %39 = load i64, ptr %38, align 4
  %40 = tail call i64 @"0x56063b3d6590"(i32 6, ptr %18, ptr nonnull inttoptr (i64 139659116036000 to ptr))
  %41 = tail call ptr @"0x56063b3c9750"(i32 7, ptr %18, ptr nonnull inttoptr (i64 139659116036000 to ptr), ptr %2)
  %42 = load ptr, ptr %41, align 8
  %43 = getelementptr i8, ptr %41, i64 16
  %44 = load i64, ptr %43, align 4
  tail call void @"0x56063b3c35c0"(ptr %18)
  %45 = tail call ptr @"0x56063b3dd7d0"(ptr %162)
  store i32 %19, ptr %45, align 4
  %46 = getelementptr i8, ptr %45, i64 4
  tail call void @"0x56063b3e7050"(ptr %162, ptr %5, ptr %21, i64 %23, ptr %46)
  %47 = getelementptr i8, ptr %45, i64 20
  tail call void @"0x56063b3e7050"(ptr %162, ptr %5, ptr %25, i64 %27, ptr %47)
  %48 = getelementptr i8, ptr %45, i64 36
  tail call void @"0x56063b3e7050"(ptr %162, ptr %5, ptr %29, i64 %31, ptr %48)
  %49 = getelementptr i8, ptr %45, i64 52
  tail call void @"0x56063b3e7050"(ptr %162, ptr %5, ptr %33, i64 %35, ptr %49)
  %50 = getelementptr i8, ptr %45, i64 68
  tail call void @"0x56063b3e7050"(ptr %162, ptr %5, ptr %37, i64 %39, ptr %50)
  %51 = getelementptr i8, ptr %45, i64 84
  store i64 %40, ptr %51, align 4
  %52 = getelementptr i8, ptr %45, i64 92
  tail call void @"0x56063b3e7050"(ptr %162, ptr %5, ptr %42, i64 %44, ptr %52)
  br label %53

53:                                               ; preds = %17, %161
  %54 = phi i64 [ 1, %17 ], [ 0, %161 ]
  %55 = getelementptr i8, ptr %164, i64 33
  %56 = load i1, ptr %55, align 1
  br i1 %56, label %61, label %57

57:                                               ; preds = %147, %._crit_edge, %53
  %58 = phi ptr [ %148, %147 ], [ %.lcssa1, %._crit_edge ], [ %162, %53 ]
  %59 = phi i64 [ %160, %147 ], [ %.lcssa, %._crit_edge ], [ %54, %53 ]
  tail call void @"0x56063b3dd750"(ptr %58, i64 %59)
  tail call void @"0x56063b3ddbf0"(ptr %58, i64 %6)
  tail call void @"0x56063b3dd8c0"(ptr %58, i64 %7)
  tail call void @"0x56063b3dd930"(ptr %58, i64 %9)
  tail call void @"0x56063b3ddcd0"(ptr %58, i64 %8)
  %60 = tail call ptr @"0x56063b154210"(ptr %0, i64 3)
  tail call void @"0x56063b141930"(ptr %60, i1 true, i64 %10, i1 %11, ptr %58)
  tail call void @"0x56063b153e20"(ptr %0, ptr %58)
  br label %16

61:                                               ; preds = %53
  %62 = getelementptr i8, ptr %164, i64 192
  %63 = load i1, ptr %62, align 1
  br i1 %63, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %61, %98
  %64 = phi i64 [ %111, %98 ], [ %54, %61 ]
  %65 = phi ptr [ %99, %98 ], [ %162, %61 ]
  %66 = tail call ptr @"0x56063b3dd7d0"(ptr %1)
  %67 = tail call i32 @"0x56063b3d4c30"(i32 0, ptr nonnull %62, ptr nonnull inttoptr (i64 139659116036000 to ptr))
  %68 = tail call ptr @"0x56063b3c9750"(i32 1, ptr nonnull %62, ptr nonnull inttoptr (i64 139659116036000 to ptr), ptr %2)
  %69 = load ptr, ptr %68, align 8
  %70 = getelementptr i8, ptr %68, i64 16
  %71 = load i64, ptr %70, align 4
  %72 = tail call ptr @"0x56063b3c9750"(i32 2, ptr nonnull %62, ptr nonnull inttoptr (i64 139659116036000 to ptr), ptr %2)
  %73 = load ptr, ptr %72, align 8
  %74 = getelementptr i8, ptr %72, i64 16
  %75 = load i64, ptr %74, align 4
  %76 = tail call ptr @"0x56063b3c9750"(i32 3, ptr nonnull %62, ptr nonnull inttoptr (i64 139659116036000 to ptr), ptr %2)
  %77 = load ptr, ptr %76, align 8
  %78 = getelementptr i8, ptr %76, i64 16
  %79 = load i64, ptr %78, align 4
  %80 = tail call ptr @"0x56063b3c9750"(i32 4, ptr nonnull %62, ptr nonnull inttoptr (i64 139659116036000 to ptr), ptr %2)
  %81 = load ptr, ptr %80, align 8
  %82 = getelementptr i8, ptr %80, i64 16
  %83 = load i64, ptr %82, align 4
  %84 = tail call ptr @"0x56063b3c9750"(i32 5, ptr nonnull %62, ptr nonnull inttoptr (i64 139659116036000 to ptr), ptr %2)
  %85 = load ptr, ptr %84, align 8
  %86 = getelementptr i8, ptr %84, i64 16
  %87 = load i64, ptr %86, align 4
  %88 = tail call i64 @"0x56063b3d6590"(i32 6, ptr nonnull %62, ptr nonnull inttoptr (i64 139659116036000 to ptr))
  %89 = tail call ptr @"0x56063b3c9750"(i32 7, ptr nonnull %62, ptr nonnull inttoptr (i64 139659116036000 to ptr), ptr %2)
  %90 = load ptr, ptr %89, align 8
  %91 = getelementptr i8, ptr %89, i64 16
  %92 = load i64, ptr %91, align 4
  tail call void @"0x56063b3c35c0"(ptr nonnull %62)
  %93 = icmp ugt i64 %64, 2426
  br i1 %93, label %94, label %98

94:                                               ; preds = %.lr.ph
  tail call void @"0x56063b3dd750"(ptr %65, i64 %64)
  tail call void @"0x56063b3ddbf0"(ptr %65, i64 %6)
  tail call void @"0x56063b3dd8c0"(ptr %65, i64 %7)
  tail call void @"0x56063b3dd930"(ptr %65, i64 %9)
  tail call void @"0x56063b3ddcd0"(ptr %65, i64 %8)
  %95 = tail call ptr @"0x56063b154210"(ptr %0, i64 3)
  tail call void @"0x56063b141930"(ptr %95, i1 false, i64 %10, i1 %11, ptr %65)
  tail call void @"0x56063b153e20"(ptr %0, ptr %65)
  %96 = tail call ptr @"0x56063b154290"(ptr %0)
  %97 = tail call ptr @"0x56063b3dd7d0"(ptr %96)
  br label %98

98:                                               ; preds = %94, %.lr.ph
  %99 = phi ptr [ %96, %94 ], [ %65, %.lr.ph ]
  %100 = phi i64 [ 0, %94 ], [ %64, %.lr.ph ]
  %101 = tail call ptr @"0x56063b3dd7d0"(ptr %99)
  %102 = mul nuw nsw i64 %100, 108
  %103 = getelementptr i8, ptr %101, i64 %102
  store i32 %67, ptr %103, align 4
  %104 = getelementptr i8, ptr %103, i64 4
  tail call void @"0x56063b3e7050"(ptr %99, ptr %5, ptr %69, i64 %71, ptr %104)
  %105 = getelementptr i8, ptr %103, i64 20
  tail call void @"0x56063b3e7050"(ptr %99, ptr %5, ptr %73, i64 %75, ptr %105)
  %106 = getelementptr i8, ptr %103, i64 36
  tail call void @"0x56063b3e7050"(ptr %99, ptr %5, ptr %77, i64 %79, ptr %106)
  %107 = getelementptr i8, ptr %103, i64 52
  tail call void @"0x56063b3e7050"(ptr %99, ptr %5, ptr %81, i64 %83, ptr %107)
  %108 = getelementptr i8, ptr %103, i64 68
  tail call void @"0x56063b3e7050"(ptr %99, ptr %5, ptr %85, i64 %87, ptr %108)
  %109 = getelementptr i8, ptr %103, i64 84
  store i64 %88, ptr %109, align 4
  %110 = getelementptr i8, ptr %103, i64 92
  tail call void @"0x56063b3e7050"(ptr %99, ptr %5, ptr %90, i64 %92, ptr %110)
  %111 = add nuw nsw i64 %100, 1
  %112 = load i1, ptr %62, align 1
  br i1 %112, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %98, %61
  %.lcssa1 = phi ptr [ %162, %61 ], [ %99, %98 ]
  %.lcssa = phi i64 [ %54, %61 ], [ %111, %98 ]
  %113 = tail call i1 @"0x56063b3c4f40"(ptr %1, ptr nonnull inttoptr (i64 139659116035992 to ptr), ptr %2)
  br i1 %113, label %114, label %57

114:                                              ; preds = %._crit_edge
  %115 = getelementptr i8, ptr %164, i64 120
  %116 = tail call i32 @"0x56063b3d4c30"(i32 0, ptr %115, ptr nonnull inttoptr (i64 139659116036000 to ptr))
  %117 = tail call ptr @"0x56063b3c9750"(i32 1, ptr %115, ptr nonnull inttoptr (i64 139659116036000 to ptr), ptr %2)
  %118 = load ptr, ptr %117, align 8
  %119 = getelementptr i8, ptr %117, i64 16
  %120 = load i64, ptr %119, align 4
  %121 = tail call ptr @"0x56063b3c9750"(i32 2, ptr %115, ptr nonnull inttoptr (i64 139659116036000 to ptr), ptr %2)
  %122 = load ptr, ptr %121, align 8
  %123 = getelementptr i8, ptr %121, i64 16
  %124 = load i64, ptr %123, align 4
  %125 = tail call ptr @"0x56063b3c9750"(i32 3, ptr %115, ptr nonnull inttoptr (i64 139659116036000 to ptr), ptr %2)
  %126 = load ptr, ptr %125, align 8
  %127 = getelementptr i8, ptr %125, i64 16
  %128 = load i64, ptr %127, align 4
  %129 = tail call ptr @"0x56063b3c9750"(i32 4, ptr %115, ptr nonnull inttoptr (i64 139659116036000 to ptr), ptr %2)
  %130 = load ptr, ptr %129, align 8
  %131 = getelementptr i8, ptr %129, i64 16
  %132 = load i64, ptr %131, align 4
  %133 = tail call ptr @"0x56063b3c9750"(i32 5, ptr %115, ptr nonnull inttoptr (i64 139659116036000 to ptr), ptr %2)
  %134 = load ptr, ptr %133, align 8
  %135 = getelementptr i8, ptr %133, i64 16
  %136 = load i64, ptr %135, align 4
  %137 = tail call i64 @"0x56063b3d6590"(i32 6, ptr %115, ptr nonnull inttoptr (i64 139659116036000 to ptr))
  %138 = tail call ptr @"0x56063b3c9750"(i32 7, ptr %115, ptr nonnull inttoptr (i64 139659116036000 to ptr), ptr %2)
  %139 = load ptr, ptr %138, align 8
  %140 = getelementptr i8, ptr %138, i64 16
  %141 = load i64, ptr %140, align 4
  tail call void @"0x56063b3c35c0"(ptr %115)
  %142 = icmp samesign ugt i64 %.lcssa, 2426
  br i1 %142, label %143, label %147

143:                                              ; preds = %114
  tail call void @"0x56063b3dd750"(ptr %.lcssa1, i64 %.lcssa)
  tail call void @"0x56063b3ddbf0"(ptr %.lcssa1, i64 %6)
  tail call void @"0x56063b3dd8c0"(ptr %.lcssa1, i64 %7)
  tail call void @"0x56063b3dd930"(ptr %.lcssa1, i64 %9)
  tail call void @"0x56063b3ddcd0"(ptr %.lcssa1, i64 %8)
  %144 = tail call ptr @"0x56063b154210"(ptr %0, i64 3)
  tail call void @"0x56063b141930"(ptr %144, i1 false, i64 %10, i1 %11, ptr %.lcssa1)
  tail call void @"0x56063b153e20"(ptr %0, ptr %.lcssa1)
  %145 = tail call ptr @"0x56063b154290"(ptr %0)
  %146 = tail call ptr @"0x56063b3dd7d0"(ptr %145)
  br label %147

147:                                              ; preds = %143, %114
  %148 = phi ptr [ %145, %143 ], [ %.lcssa1, %114 ]
  %149 = phi i64 [ 0, %143 ], [ %.lcssa, %114 ]
  %150 = tail call ptr @"0x56063b3dd7d0"(ptr %148)
  %151 = mul nuw nsw i64 %149, 108
  %152 = getelementptr i8, ptr %150, i64 %151
  store i32 %116, ptr %152, align 4
  %153 = getelementptr i8, ptr %152, i64 4
  tail call void @"0x56063b3e7050"(ptr %148, ptr %5, ptr %118, i64 %120, ptr %153)
  %154 = getelementptr i8, ptr %152, i64 20
  tail call void @"0x56063b3e7050"(ptr %148, ptr %5, ptr %122, i64 %124, ptr %154)
  %155 = getelementptr i8, ptr %152, i64 36
  tail call void @"0x56063b3e7050"(ptr %148, ptr %5, ptr %126, i64 %128, ptr %155)
  %156 = getelementptr i8, ptr %152, i64 52
  tail call void @"0x56063b3e7050"(ptr %148, ptr %5, ptr %130, i64 %132, ptr %156)
  %157 = getelementptr i8, ptr %152, i64 68
  tail call void @"0x56063b3e7050"(ptr %148, ptr %5, ptr %134, i64 %136, ptr %157)
  %158 = getelementptr i8, ptr %152, i64 84
  store i64 %137, ptr %158, align 4
  %159 = getelementptr i8, ptr %152, i64 92
  tail call void @"0x56063b3e7050"(ptr %148, ptr %5, ptr %139, i64 %141, ptr %159)
  %160 = add nuw nsw i64 %149, 1
  br label %57

161:                                              ; preds = %3
  %162 = tail call ptr @"0x56063b154290"(ptr %0)
  %163 = tail call ptr @"0x56063b3dd7d0"(ptr %162)
  %164 = tail call ptr @"0x56063b3c1b40"()
  %165 = getelementptr i8, ptr %164, i64 32
  %166 = load i1, ptr %165, align 1
  br i1 %166, label %17, label %53
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
