; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: memory(readwrite, errnomem: none)
declare i32 @"0x560533d92d60"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x560533d92d90"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i64 @"0x5605340a1de0"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i64 @"0x5605340a1ab0"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i64 @"0x5605340a1f00"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i64 @"0x5605340a1ed0"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i64 @"0x5605340a1c80"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i1 @"0x5605340a1d70"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i64 @"0x5605340a1f60"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x56053408cf50"(ptr, ptr, ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x560533daa7e0"(ptr, ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x560533d93300"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x5605340a1a30"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x560534088820"() local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x56053408feb0"(i32, ptr, ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x56053408f510"(i32, ptr, ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x56053408a2c0"(ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i32 @"0x560533ff8c90"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x5605340a19b0"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x5605340a1e50"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x5605340a1b20"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x5605340a1b90"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x5605340a1f30"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x5605340a1f90"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare ptr @"0x560533d93280"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x560533d81290"(ptr, i1, i64, i1, ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x560533d92e90"(ptr, ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare void @"0x5605340ab5e0"(ptr, ptr, ptr, i64, ptr) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i64 @"0x560533ffa6d0"(ptr, i64) local_unnamed_addr #0

; Function Attrs: memory(readwrite, errnomem: none)
declare i1 @"0x56053408bc40"(ptr, ptr, ptr) local_unnamed_addr #0

define void @execute(ptr %0, ptr %1, ptr %2) local_unnamed_addr #1 {
  %4 = tail call i32 @"0x560533d92d60"(ptr %0)
  %5 = tail call ptr @"0x560533d92d90"(ptr %0)
  %6 = tail call i64 @"0x5605340a1de0"(ptr %1)
  %7 = tail call i64 @"0x5605340a1ab0"(ptr %1)
  %8 = tail call i64 @"0x5605340a1f00"(ptr %1)
  %9 = tail call i64 @"0x5605340a1ed0"(ptr %1)
  %10 = tail call i64 @"0x5605340a1c80"(ptr %1)
  %11 = tail call i1 @"0x5605340a1d70"(ptr %1)
  %12 = tail call i64 @"0x5605340a1f60"(ptr %1)
  %13 = tail call ptr @"0x56053408cf50"(ptr %1, ptr nonnull inttoptr (i64 140024658033288 to ptr), ptr %2)
  %14 = getelementptr i8, ptr %13, i64 34
  %15 = load i1, ptr %14, align 1
  br i1 %15, label %16, label %189

16:                                               ; preds = %3
  tail call void @"0x560533daa7e0"(ptr %0, ptr %1)
  br label %17

17:                                               ; preds = %16, %67
  ret void

18:                                               ; preds = %189
  %19 = getelementptr i8, ptr %192, i64 48
  %20 = tail call ptr @"0x56053408feb0"(i32 0, ptr %19, ptr nonnull inttoptr (i64 140024658033296 to ptr))
  %21 = getelementptr i8, ptr %20, i64 8
  %22 = load ptr, ptr %20, align 8
  %23 = load i64, ptr %21, align 4
  %24 = tail call ptr @"0x56053408f510"(i32 1, ptr %19, ptr nonnull inttoptr (i64 140024658033296 to ptr))
  %25 = load ptr, ptr %24, align 8
  %26 = getelementptr i8, ptr %24, i64 8
  %27 = load i64, ptr %26, align 4
  %28 = tail call ptr @"0x56053408f510"(i32 2, ptr %19, ptr nonnull inttoptr (i64 140024658033296 to ptr))
  %29 = load ptr, ptr %28, align 8
  %30 = getelementptr i8, ptr %28, i64 8
  %31 = load i64, ptr %30, align 4
  %32 = tail call ptr @"0x56053408f510"(i32 3, ptr %19, ptr nonnull inttoptr (i64 140024658033296 to ptr))
  %33 = load ptr, ptr %32, align 8
  %34 = getelementptr i8, ptr %32, i64 8
  %35 = load i64, ptr %34, align 4
  %36 = tail call ptr @"0x56053408f510"(i32 4, ptr %19, ptr nonnull inttoptr (i64 140024658033296 to ptr))
  %37 = load ptr, ptr %36, align 8
  %38 = getelementptr i8, ptr %36, i64 8
  %39 = load i64, ptr %38, align 4
  %40 = tail call ptr @"0x56053408f510"(i32 5, ptr %19, ptr nonnull inttoptr (i64 140024658033296 to ptr))
  %41 = load ptr, ptr %40, align 8
  %42 = getelementptr i8, ptr %40, i64 8
  %43 = load i64, ptr %42, align 4
  %44 = tail call ptr @"0x56053408feb0"(i32 6, ptr %19, ptr nonnull inttoptr (i64 140024658033296 to ptr))
  %45 = getelementptr i8, ptr %44, i64 8
  %46 = load ptr, ptr %44, align 8
  %47 = load i64, ptr %45, align 4
  %48 = tail call ptr @"0x56053408f510"(i32 7, ptr %19, ptr nonnull inttoptr (i64 140024658033296 to ptr))
  %49 = load ptr, ptr %48, align 8
  %50 = getelementptr i8, ptr %48, i64 8
  %51 = load i64, ptr %50, align 4
  tail call void @"0x56053408a2c0"(ptr %19)
  %52 = tail call i32 @"0x560533ff8c90"(ptr %22, i64 %23)
  %.not = icmp eq i32 %52, 1018
  br i1 %.not, label %53, label %63

53:                                               ; preds = %18
  %54 = tail call ptr @"0x5605340a1a30"(ptr %190)
  store i32 1018, ptr %54, align 4
  %55 = getelementptr i8, ptr %54, i64 4
  tail call void @"0x5605340ab5e0"(ptr %190, ptr %5, ptr %25, i64 %27, ptr %55)
  %56 = getelementptr i8, ptr %54, i64 20
  tail call void @"0x5605340ab5e0"(ptr %190, ptr %5, ptr %29, i64 %31, ptr %56)
  %57 = getelementptr i8, ptr %54, i64 36
  tail call void @"0x5605340ab5e0"(ptr %190, ptr %5, ptr %33, i64 %35, ptr %57)
  %58 = getelementptr i8, ptr %54, i64 52
  tail call void @"0x5605340ab5e0"(ptr %190, ptr %5, ptr %37, i64 %39, ptr %58)
  %59 = getelementptr i8, ptr %54, i64 68
  tail call void @"0x5605340ab5e0"(ptr %190, ptr %5, ptr %41, i64 %43, ptr %59)
  %60 = getelementptr i8, ptr %54, i64 84
  %61 = tail call i64 @"0x560533ffa6d0"(ptr %46, i64 %47)
  store i64 %61, ptr %60, align 4
  %62 = getelementptr i8, ptr %54, i64 92
  tail call void @"0x5605340ab5e0"(ptr %190, ptr %5, ptr %49, i64 %51, ptr %62)
  br label %63

63:                                               ; preds = %53, %18, %189
  %64 = phi i64 [ 1, %53 ], [ 0, %18 ], [ 0, %189 ]
  %65 = getelementptr i8, ptr %192, i64 33
  %66 = load i1, ptr %65, align 1
  br i1 %66, label %71, label %67

67:                                               ; preds = %174, %133, %131, %63
  %68 = phi ptr [ %175, %174 ], [ %.ph, %133 ], [ %.ph, %131 ], [ %190, %63 ]
  %69 = phi i64 [ %188, %174 ], [ %.ph3, %133 ], [ %.ph3, %131 ], [ %64, %63 ]
  tail call void @"0x5605340a19b0"(ptr %68, i64 %69)
  tail call void @"0x5605340a1e50"(ptr %68, i64 %6)
  tail call void @"0x5605340a1b20"(ptr %68, i64 %7)
  tail call void @"0x5605340a1b90"(ptr %68, i64 %9)
  tail call void @"0x5605340a1f30"(ptr %68, i64 %8)
  tail call void @"0x5605340a1f90"(ptr %68, i64 %12)
  %70 = tail call ptr @"0x560533d93280"(ptr %0, i64 2)
  tail call void @"0x560533d81290"(ptr %70, i1 true, i64 %10, i1 %11, ptr %68)
  tail call void @"0x560533d92e90"(ptr %0, ptr %68)
  br label %17

71:                                               ; preds = %63
  %72 = getelementptr i8, ptr %192, i64 192
  br label %.outer

.outer:                                           ; preds = %71, %116
  %.ph = phi ptr [ %190, %71 ], [ %117, %116 ]
  %.ph3 = phi i64 [ %64, %71 ], [ %130, %116 ]
  br label %73

73:                                               ; preds = %.outer, %75
  %74 = load i1, ptr %72, align 1
  br i1 %74, label %131, label %75

75:                                               ; preds = %73
  %76 = tail call ptr @"0x5605340a1a30"(ptr %1)
  %77 = tail call ptr @"0x56053408feb0"(i32 0, ptr nonnull %72, ptr nonnull inttoptr (i64 140024658033296 to ptr))
  %78 = getelementptr i8, ptr %77, i64 8
  %79 = load ptr, ptr %77, align 8
  %80 = load i64, ptr %78, align 4
  %81 = tail call ptr @"0x56053408f510"(i32 1, ptr nonnull %72, ptr nonnull inttoptr (i64 140024658033296 to ptr))
  %82 = load ptr, ptr %81, align 8
  %83 = getelementptr i8, ptr %81, i64 8
  %84 = load i64, ptr %83, align 4
  %85 = tail call ptr @"0x56053408f510"(i32 2, ptr nonnull %72, ptr nonnull inttoptr (i64 140024658033296 to ptr))
  %86 = load ptr, ptr %85, align 8
  %87 = getelementptr i8, ptr %85, i64 8
  %88 = load i64, ptr %87, align 4
  %89 = tail call ptr @"0x56053408f510"(i32 3, ptr nonnull %72, ptr nonnull inttoptr (i64 140024658033296 to ptr))
  %90 = load ptr, ptr %89, align 8
  %91 = getelementptr i8, ptr %89, i64 8
  %92 = load i64, ptr %91, align 4
  %93 = tail call ptr @"0x56053408f510"(i32 4, ptr nonnull %72, ptr nonnull inttoptr (i64 140024658033296 to ptr))
  %94 = load ptr, ptr %93, align 8
  %95 = getelementptr i8, ptr %93, i64 8
  %96 = load i64, ptr %95, align 4
  %97 = tail call ptr @"0x56053408f510"(i32 5, ptr nonnull %72, ptr nonnull inttoptr (i64 140024658033296 to ptr))
  %98 = load ptr, ptr %97, align 8
  %99 = getelementptr i8, ptr %97, i64 8
  %100 = load i64, ptr %99, align 4
  %101 = tail call ptr @"0x56053408feb0"(i32 6, ptr nonnull %72, ptr nonnull inttoptr (i64 140024658033296 to ptr))
  %102 = getelementptr i8, ptr %101, i64 8
  %103 = load ptr, ptr %101, align 8
  %104 = load i64, ptr %102, align 4
  %105 = tail call ptr @"0x56053408f510"(i32 7, ptr nonnull %72, ptr nonnull inttoptr (i64 140024658033296 to ptr))
  %106 = load ptr, ptr %105, align 8
  %107 = getelementptr i8, ptr %105, i64 8
  %108 = load i64, ptr %107, align 4
  tail call void @"0x56053408a2c0"(ptr nonnull %72)
  %109 = tail call i32 @"0x560533ff8c90"(ptr %79, i64 %80)
  %.not2 = icmp eq i32 %109, 1018
  br i1 %.not2, label %110, label %73

110:                                              ; preds = %75
  %111 = icmp ugt i64 %.ph3, 2426
  br i1 %111, label %112, label %116

112:                                              ; preds = %110
  tail call void @"0x5605340a19b0"(ptr %.ph, i64 %.ph3)
  tail call void @"0x5605340a1e50"(ptr %.ph, i64 %6)
  tail call void @"0x5605340a1b20"(ptr %.ph, i64 %7)
  tail call void @"0x5605340a1b90"(ptr %.ph, i64 %9)
  tail call void @"0x5605340a1f30"(ptr %.ph, i64 %8)
  tail call void @"0x5605340a1f90"(ptr %.ph, i64 %12)
  %113 = tail call ptr @"0x560533d93280"(ptr %0, i64 2)
  tail call void @"0x560533d81290"(ptr %113, i1 false, i64 %10, i1 %11, ptr %.ph)
  tail call void @"0x560533d92e90"(ptr %0, ptr %.ph)
  %114 = tail call ptr @"0x560533d93300"(ptr %0)
  %115 = tail call ptr @"0x5605340a1a30"(ptr %114)
  br label %116

116:                                              ; preds = %112, %110
  %117 = phi ptr [ %114, %112 ], [ %.ph, %110 ]
  %118 = phi i64 [ 0, %112 ], [ %.ph3, %110 ]
  %119 = tail call ptr @"0x5605340a1a30"(ptr %117)
  %120 = mul nuw nsw i64 %118, 108
  %121 = getelementptr i8, ptr %119, i64 %120
  store i32 1018, ptr %121, align 4
  %122 = getelementptr i8, ptr %121, i64 4
  tail call void @"0x5605340ab5e0"(ptr %117, ptr %5, ptr %82, i64 %84, ptr %122)
  %123 = getelementptr i8, ptr %121, i64 20
  tail call void @"0x5605340ab5e0"(ptr %117, ptr %5, ptr %86, i64 %88, ptr %123)
  %124 = getelementptr i8, ptr %121, i64 36
  tail call void @"0x5605340ab5e0"(ptr %117, ptr %5, ptr %90, i64 %92, ptr %124)
  %125 = getelementptr i8, ptr %121, i64 52
  tail call void @"0x5605340ab5e0"(ptr %117, ptr %5, ptr %94, i64 %96, ptr %125)
  %126 = getelementptr i8, ptr %121, i64 68
  tail call void @"0x5605340ab5e0"(ptr %117, ptr %5, ptr %98, i64 %100, ptr %126)
  %127 = getelementptr i8, ptr %121, i64 84
  %128 = tail call i64 @"0x560533ffa6d0"(ptr %103, i64 %104)
  store i64 %128, ptr %127, align 4
  %129 = getelementptr i8, ptr %121, i64 92
  tail call void @"0x5605340ab5e0"(ptr %117, ptr %5, ptr %106, i64 %108, ptr %129)
  %130 = add nuw nsw i64 %118, 1
  br label %.outer

131:                                              ; preds = %73
  %132 = tail call i1 @"0x56053408bc40"(ptr %1, ptr nonnull inttoptr (i64 140024658033288 to ptr), ptr %2)
  br i1 %132, label %133, label %67

133:                                              ; preds = %131
  %134 = getelementptr i8, ptr %192, i64 120
  %135 = tail call ptr @"0x56053408feb0"(i32 0, ptr %134, ptr nonnull inttoptr (i64 140024658033296 to ptr))
  %136 = getelementptr i8, ptr %135, i64 8
  %137 = load ptr, ptr %135, align 8
  %138 = load i64, ptr %136, align 4
  %139 = tail call ptr @"0x56053408f510"(i32 1, ptr %134, ptr nonnull inttoptr (i64 140024658033296 to ptr))
  %140 = load ptr, ptr %139, align 8
  %141 = getelementptr i8, ptr %139, i64 8
  %142 = load i64, ptr %141, align 4
  %143 = tail call ptr @"0x56053408f510"(i32 2, ptr %134, ptr nonnull inttoptr (i64 140024658033296 to ptr))
  %144 = load ptr, ptr %143, align 8
  %145 = getelementptr i8, ptr %143, i64 8
  %146 = load i64, ptr %145, align 4
  %147 = tail call ptr @"0x56053408f510"(i32 3, ptr %134, ptr nonnull inttoptr (i64 140024658033296 to ptr))
  %148 = load ptr, ptr %147, align 8
  %149 = getelementptr i8, ptr %147, i64 8
  %150 = load i64, ptr %149, align 4
  %151 = tail call ptr @"0x56053408f510"(i32 4, ptr %134, ptr nonnull inttoptr (i64 140024658033296 to ptr))
  %152 = load ptr, ptr %151, align 8
  %153 = getelementptr i8, ptr %151, i64 8
  %154 = load i64, ptr %153, align 4
  %155 = tail call ptr @"0x56053408f510"(i32 5, ptr %134, ptr nonnull inttoptr (i64 140024658033296 to ptr))
  %156 = load ptr, ptr %155, align 8
  %157 = getelementptr i8, ptr %155, i64 8
  %158 = load i64, ptr %157, align 4
  %159 = tail call ptr @"0x56053408feb0"(i32 6, ptr %134, ptr nonnull inttoptr (i64 140024658033296 to ptr))
  %160 = getelementptr i8, ptr %159, i64 8
  %161 = load ptr, ptr %159, align 8
  %162 = load i64, ptr %160, align 4
  %163 = tail call ptr @"0x56053408f510"(i32 7, ptr %134, ptr nonnull inttoptr (i64 140024658033296 to ptr))
  %164 = load ptr, ptr %163, align 8
  %165 = getelementptr i8, ptr %163, i64 8
  %166 = load i64, ptr %165, align 4
  tail call void @"0x56053408a2c0"(ptr %134)
  %167 = tail call i32 @"0x560533ff8c90"(ptr %137, i64 %138)
  %.not1 = icmp eq i32 %167, 1018
  br i1 %.not1, label %168, label %67

168:                                              ; preds = %133
  %169 = icmp ugt i64 %.ph3, 2426
  br i1 %169, label %170, label %174

170:                                              ; preds = %168
  tail call void @"0x5605340a19b0"(ptr %.ph, i64 %.ph3)
  tail call void @"0x5605340a1e50"(ptr %.ph, i64 %6)
  tail call void @"0x5605340a1b20"(ptr %.ph, i64 %7)
  tail call void @"0x5605340a1b90"(ptr %.ph, i64 %9)
  tail call void @"0x5605340a1f30"(ptr %.ph, i64 %8)
  tail call void @"0x5605340a1f90"(ptr %.ph, i64 %12)
  %171 = tail call ptr @"0x560533d93280"(ptr %0, i64 2)
  tail call void @"0x560533d81290"(ptr %171, i1 false, i64 %10, i1 %11, ptr %.ph)
  tail call void @"0x560533d92e90"(ptr %0, ptr %.ph)
  %172 = tail call ptr @"0x560533d93300"(ptr %0)
  %173 = tail call ptr @"0x5605340a1a30"(ptr %172)
  br label %174

174:                                              ; preds = %170, %168
  %175 = phi ptr [ %172, %170 ], [ %.ph, %168 ]
  %176 = phi i64 [ 0, %170 ], [ %.ph3, %168 ]
  %177 = tail call ptr @"0x5605340a1a30"(ptr %175)
  %178 = mul nuw nsw i64 %176, 108
  %179 = getelementptr i8, ptr %177, i64 %178
  store i32 1018, ptr %179, align 4
  %180 = getelementptr i8, ptr %179, i64 4
  tail call void @"0x5605340ab5e0"(ptr %175, ptr %5, ptr %140, i64 %142, ptr %180)
  %181 = getelementptr i8, ptr %179, i64 20
  tail call void @"0x5605340ab5e0"(ptr %175, ptr %5, ptr %144, i64 %146, ptr %181)
  %182 = getelementptr i8, ptr %179, i64 36
  tail call void @"0x5605340ab5e0"(ptr %175, ptr %5, ptr %148, i64 %150, ptr %182)
  %183 = getelementptr i8, ptr %179, i64 52
  tail call void @"0x5605340ab5e0"(ptr %175, ptr %5, ptr %152, i64 %154, ptr %183)
  %184 = getelementptr i8, ptr %179, i64 68
  tail call void @"0x5605340ab5e0"(ptr %175, ptr %5, ptr %156, i64 %158, ptr %184)
  %185 = getelementptr i8, ptr %179, i64 84
  %186 = tail call i64 @"0x560533ffa6d0"(ptr %161, i64 %162)
  store i64 %186, ptr %185, align 4
  %187 = getelementptr i8, ptr %179, i64 92
  tail call void @"0x5605340ab5e0"(ptr %175, ptr %5, ptr %164, i64 %166, ptr %187)
  %188 = add nuw nsw i64 %176, 1
  br label %67

189:                                              ; preds = %3
  %190 = tail call ptr @"0x560533d93300"(ptr %0)
  %191 = tail call ptr @"0x5605340a1a30"(ptr %190)
  %192 = tail call ptr @"0x560534088820"()
  %193 = getelementptr i8, ptr %192, i64 32
  %194 = load i1, ptr %193, align 1
  br i1 %194, label %18, label %63
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
