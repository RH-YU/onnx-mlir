module attributes {llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-unknown-linux-gnu"} {
  llvm.func @strncmp(!llvm.ptr<i8>, !llvm.ptr<i8>, i64) -> i32
  llvm.mlir.global external constant @_entry_point_0("run_main_graph\00")
  llvm.mlir.global external constant @_entry_point_0_in_sig("[    { \22type\22 : \22f32\22 , \22dims\22 : [3 , 2] , \22name\22 : \22X1\22 }\0A ,    { \22type\22 : \22f32\22 , \22dims\22 : [3 , 2] , \22name\22 : \22X2\22 }\0A\0A]\00")
  llvm.mlir.global external constant @_entry_point_0_out_sig("[   { \22type\22 : \22f32\22 , \22dims\22 : [3 , 2] , \22name\22 : \22Y\22 }\0A\0A]\00")
  llvm.mlir.global internal constant @_entry_point_arrays() : !llvm.array<2 x ptr<i8>> {
    %0 = llvm.mlir.undef : !llvm.array<2 x ptr<i8>>
    %1 = llvm.mlir.constant(0 : i64) : i64
    %2 = llvm.mlir.addressof @_entry_point_0 : !llvm.ptr<array<15 x i8>>
    %3 = llvm.getelementptr %2[%1, %1] : (!llvm.ptr<array<15 x i8>>, i64, i64) -> !llvm.ptr<i8>
    %4 = llvm.insertvalue %3, %0[0 : index] : !llvm.array<2 x ptr<i8>>
    %5 = llvm.mlir.null : !llvm.ptr<i8>
    %6 = llvm.insertvalue %5, %4[1 : index] : !llvm.array<2 x ptr<i8>>
    llvm.return %6 : !llvm.array<2 x ptr<i8>>
  }
  llvm.func @omTensorPrint(!llvm.ptr<i8>, !llvm.ptr<i8>)
  llvm.func @omTensorListGetOmtArray(!llvm.ptr<i8>) -> !llvm.ptr<ptr<i8>>
  llvm.func @omTensorSetDataType(!llvm.ptr<i8>, i64)
  llvm.func @omTensorGetDataType(!llvm.ptr<i8>) -> i64
  llvm.func @omTensorGetStrides(!llvm.ptr<i8>) -> !llvm.ptr<i64>
  llvm.func @omTensorGetShape(!llvm.ptr<i8>) -> !llvm.ptr<i64>
  llvm.func @omTensorSetDataPtr(!llvm.ptr<i8>, i64, !llvm.ptr<i8>, !llvm.ptr<i8>)
  llvm.func @omTensorGetDataPtr(!llvm.ptr<i8>) -> !llvm.ptr<i8>
  llvm.func @omTensorCreateUntyped(i64) -> !llvm.ptr<i8>
  llvm.func @omTensorListCreateWithOwnership(!llvm.ptr<ptr<i8>>, i64, i64) -> !llvm.ptr<i8>
  llvm.func @malloc(i64) -> !llvm.ptr<i8>
  llvm.func @main_graph(%arg0: !llvm.ptr<f32>, %arg1: !llvm.ptr<f32>, %arg2: i64, %arg3: i64, %arg4: i64, %arg5: i64, %arg6: i64, %arg7: !llvm.ptr<f32>, %arg8: !llvm.ptr<f32>, %arg9: i64, %arg10: i64, %arg11: i64, %arg12: i64, %arg13: i64) -> !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> attributes {input_names = ["X1", "X2"], output_names = ["Y"]} {
    %0 = llvm.mlir.constant(0 : index) : i64
    %1 = llvm.mlir.constant(3 : index) : i64
    %2 = llvm.mlir.constant(1 : index) : i64
    %3 = llvm.mlir.constant(2 : index) : i64
    %4 = llvm.mlir.constant(3 : index) : i64
    %5 = llvm.mlir.constant(2 : index) : i64
    %6 = llvm.mlir.constant(1 : index) : i64
    %7 = llvm.mlir.constant(6 : index) : i64
    %8 = llvm.mlir.null : !llvm.ptr<f32>
    %9 = llvm.getelementptr %8[%7] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %10 = llvm.ptrtoint %9 : !llvm.ptr<f32> to i64
    %11 = llvm.mlir.constant(16 : index) : i64
    %12 = llvm.add %10, %11  : i64
    %13 = llvm.call @malloc(%12) : (i64) -> !llvm.ptr<i8>
    %14 = llvm.bitcast %13 : !llvm.ptr<i8> to !llvm.ptr<f32>
    %15 = llvm.ptrtoint %14 : !llvm.ptr<f32> to i64
    %16 = llvm.mlir.constant(1 : index) : i64
    %17 = llvm.sub %11, %16  : i64
    %18 = llvm.add %15, %17  : i64
    %19 = llvm.urem %18, %11  : i64
    %20 = llvm.sub %18, %19  : i64
    %21 = llvm.inttoptr %20 : i64 to !llvm.ptr<f32>
    %22 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %23 = llvm.insertvalue %14, %22[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %24 = llvm.insertvalue %21, %23[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %25 = llvm.mlir.constant(0 : index) : i64
    %26 = llvm.insertvalue %25, %24[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %27 = llvm.insertvalue %4, %26[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %28 = llvm.insertvalue %5, %27[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %29 = llvm.insertvalue %5, %28[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %30 = llvm.insertvalue %6, %29[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    llvm.br ^bb1(%0 : i64)
  ^bb1(%31: i64):  // 2 preds: ^bb0, ^bb5
    %32 = llvm.icmp "slt" %31, %1 : i64
    llvm.cond_br %32, ^bb2, ^bb6
  ^bb2:  // pred: ^bb1
    llvm.br ^bb3(%0 : i64)
  ^bb3(%33: i64):  // 2 preds: ^bb2, ^bb4
    %34 = llvm.icmp "slt" %33, %3 : i64
    llvm.cond_br %34, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    %35 = llvm.mlir.constant(2 : index) : i64
    %36 = llvm.mul %31, %35  : i64
    %37 = llvm.add %36, %33  : i64
    %38 = llvm.getelementptr %arg1[%37] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %39 = llvm.load %38 : !llvm.ptr<f32>
    %40 = llvm.mlir.constant(2 : index) : i64
    %41 = llvm.mul %31, %40  : i64
    %42 = llvm.add %41, %33  : i64
    %43 = llvm.getelementptr %arg8[%42] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %44 = llvm.load %43 : !llvm.ptr<f32>
    %45 = llvm.fadd %39, %44  : f32
    %46 = llvm.mlir.constant(2 : index) : i64
    %47 = llvm.mul %31, %46  : i64
    %48 = llvm.add %47, %33  : i64
    %49 = llvm.getelementptr %21[%48] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    llvm.store %45, %49 : !llvm.ptr<f32>
    %50 = llvm.add %33, %2  : i64
    llvm.br ^bb3(%50 : i64)
  ^bb5:  // pred: ^bb3
    %51 = llvm.add %31, %2  : i64
    llvm.br ^bb1(%51 : i64)
  ^bb6:  // pred: ^bb1
    llvm.return %30 : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
  }
  llvm.func @_mlir_ciface_main_graph(%arg0: !llvm.ptr<struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>>, %arg1: !llvm.ptr<struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>>, %arg2: !llvm.ptr<struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>>) attributes {input_names = ["X1", "X2"], output_names = ["Y"]} {
    %0 = llvm.load %arg1 : !llvm.ptr<struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>>
    %1 = llvm.extractvalue %0[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %2 = llvm.extractvalue %0[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %3 = llvm.extractvalue %0[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %4 = llvm.extractvalue %0[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %5 = llvm.extractvalue %0[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %6 = llvm.extractvalue %0[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %7 = llvm.extractvalue %0[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %8 = llvm.load %arg2 : !llvm.ptr<struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>>
    %9 = llvm.extractvalue %8[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %10 = llvm.extractvalue %8[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %11 = llvm.extractvalue %8[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %12 = llvm.extractvalue %8[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %13 = llvm.extractvalue %8[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %14 = llvm.extractvalue %8[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %15 = llvm.extractvalue %8[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %16 = llvm.call @main_graph(%1, %2, %3, %4, %5, %6, %7, %9, %10, %11, %12, %13, %14, %15) : (!llvm.ptr<f32>, !llvm.ptr<f32>, i64, i64, i64, i64, i64, !llvm.ptr<f32>, !llvm.ptr<f32>, i64, i64, i64, i64, i64) -> !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    llvm.store %16, %arg0 : !llvm.ptr<struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>>
    llvm.return
  }
  llvm.func @run_main_graph(%arg0: !llvm.ptr<i8>) -> !llvm.ptr<i8> {
    %0 = llvm.call @omTensorListGetOmtArray(%arg0) : (!llvm.ptr<i8>) -> !llvm.ptr<ptr<i8>>
    %1 = llvm.mlir.constant(1 : i64) : i64
    %2 = llvm.alloca %1 x !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> : (i64) -> !llvm.ptr<struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>>
    %3 = llvm.load %0 : !llvm.ptr<ptr<i8>>
    %4 = llvm.alloca %1 x !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> : (i64) -> !llvm.ptr<struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>>
    %5 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %6 = llvm.call @omTensorGetDataPtr(%3) : (!llvm.ptr<i8>) -> !llvm.ptr<i8>
    %7 = llvm.bitcast %6 : !llvm.ptr<i8> to !llvm.ptr<f32>
    %8 = llvm.insertvalue %7, %5[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %9 = llvm.insertvalue %7, %8[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %10 = llvm.mlir.constant(0 : i64) : i64
    %11 = llvm.insertvalue %10, %9[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %12 = llvm.call @omTensorGetShape(%3) : (!llvm.ptr<i8>) -> !llvm.ptr<i64>
    %13 = llvm.call @omTensorGetStrides(%3) : (!llvm.ptr<i8>) -> !llvm.ptr<i64>
    %14 = llvm.load %12 : !llvm.ptr<i64>
    %15 = llvm.insertvalue %14, %11[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %16 = llvm.load %13 : !llvm.ptr<i64>
    %17 = llvm.insertvalue %16, %15[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %18 = llvm.mlir.constant(1 : i64) : i64
    %19 = llvm.getelementptr %12[%18] : (!llvm.ptr<i64>, i64) -> !llvm.ptr<i64>
    %20 = llvm.load %19 : !llvm.ptr<i64>
    %21 = llvm.insertvalue %20, %17[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %22 = llvm.getelementptr %13[%18] : (!llvm.ptr<i64>, i64) -> !llvm.ptr<i64>
    %23 = llvm.load %22 : !llvm.ptr<i64>
    %24 = llvm.insertvalue %23, %21[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    llvm.store %24, %4 : !llvm.ptr<struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>>
    %25 = llvm.mlir.constant(1 : i64) : i64
    %26 = llvm.getelementptr %0[%25] : (!llvm.ptr<ptr<i8>>, i64) -> !llvm.ptr<ptr<i8>>
    %27 = llvm.load %26 : !llvm.ptr<ptr<i8>>
    %28 = llvm.alloca %1 x !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> : (i64) -> !llvm.ptr<struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>>
    %29 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %30 = llvm.call @omTensorGetDataPtr(%27) : (!llvm.ptr<i8>) -> !llvm.ptr<i8>
    %31 = llvm.bitcast %30 : !llvm.ptr<i8> to !llvm.ptr<f32>
    %32 = llvm.insertvalue %31, %29[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %33 = llvm.insertvalue %31, %32[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %34 = llvm.mlir.constant(0 : i64) : i64
    %35 = llvm.insertvalue %34, %33[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %36 = llvm.call @omTensorGetShape(%27) : (!llvm.ptr<i8>) -> !llvm.ptr<i64>
    %37 = llvm.call @omTensorGetStrides(%27) : (!llvm.ptr<i8>) -> !llvm.ptr<i64>
    %38 = llvm.load %36 : !llvm.ptr<i64>
    %39 = llvm.insertvalue %38, %35[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %40 = llvm.load %37 : !llvm.ptr<i64>
    %41 = llvm.insertvalue %40, %39[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %42 = llvm.mlir.constant(1 : i64) : i64
    %43 = llvm.getelementptr %36[%42] : (!llvm.ptr<i64>, i64) -> !llvm.ptr<i64>
    %44 = llvm.load %43 : !llvm.ptr<i64>
    %45 = llvm.insertvalue %44, %41[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %46 = llvm.getelementptr %37[%42] : (!llvm.ptr<i64>, i64) -> !llvm.ptr<i64>
    %47 = llvm.load %46 : !llvm.ptr<i64>
    %48 = llvm.insertvalue %47, %45[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    llvm.store %48, %28 : !llvm.ptr<struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>>
    llvm.call @_mlir_ciface_main_graph(%2, %4, %28) : (!llvm.ptr<struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>>, !llvm.ptr<struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>>, !llvm.ptr<struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>>) -> ()
    %49 = llvm.load %2 : !llvm.ptr<struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>>
    %50 = llvm.mlir.constant(1 : i64) : i64
    %51 = llvm.mlir.constant(8 : i64) : i64
    %52 = llvm.call @malloc(%51) : (i64) -> !llvm.ptr<i8>
    %53 = llvm.bitcast %52 : !llvm.ptr<i8> to !llvm.ptr<ptr<i8>>
    %54 = llvm.mlir.constant(2 : i64) : i64
    %55 = llvm.call @omTensorCreateUntyped(%54) : (i64) -> !llvm.ptr<i8>
    %56 = llvm.mlir.constant(1 : i64) : i64
    %57 = llvm.extractvalue %49[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %58 = llvm.bitcast %57 : !llvm.ptr<f32> to !llvm.ptr<i8>
    %59 = llvm.extractvalue %49[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %60 = llvm.bitcast %59 : !llvm.ptr<f32> to !llvm.ptr<i8>
    llvm.call @omTensorSetDataPtr(%55, %56, %58, %60) : (!llvm.ptr<i8>, i64, !llvm.ptr<i8>, !llvm.ptr<i8>) -> ()
    %61 = llvm.mlir.constant(1 : i64) : i64
    llvm.call @omTensorSetDataType(%55, %61) : (!llvm.ptr<i8>, i64) -> ()
    %62 = llvm.call @omTensorGetShape(%55) : (!llvm.ptr<i8>) -> !llvm.ptr<i64>
    %63 = llvm.call @omTensorGetStrides(%55) : (!llvm.ptr<i8>) -> !llvm.ptr<i64>
    %64 = llvm.extractvalue %49[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    llvm.store %64, %62 : !llvm.ptr<i64>
    %65 = llvm.extractvalue %49[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    llvm.store %65, %63 : !llvm.ptr<i64>
    %66 = llvm.mlir.constant(1 : i64) : i64
    %67 = llvm.extractvalue %49[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %68 = llvm.getelementptr %62[%66] : (!llvm.ptr<i64>, i64) -> !llvm.ptr<i64>
    llvm.store %67, %68 : !llvm.ptr<i64>
    %69 = llvm.extractvalue %49[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %70 = llvm.getelementptr %63[%66] : (!llvm.ptr<i64>, i64) -> !llvm.ptr<i64>
    llvm.store %69, %70 : !llvm.ptr<i64>
    llvm.store %55, %53 : !llvm.ptr<ptr<i8>>
    %71 = llvm.call @omTensorListCreateWithOwnership(%53, %50, %1) : (!llvm.ptr<ptr<i8>>, i64, i64) -> !llvm.ptr<i8>
    llvm.return %71 : !llvm.ptr<i8>
  }
  llvm.func @omQueryEntryPoints(%arg0: !llvm.ptr<i64>) -> !llvm.ptr<ptr<i8>> {
    %0 = llvm.mlir.null : !llvm.ptr<i64>
    %1 = llvm.icmp "ne" %arg0, %0 : !llvm.ptr<i64>
    llvm.cond_br %1, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    %2 = llvm.mlir.constant(1 : i64) : i64
    llvm.store %2, %arg0 : !llvm.ptr<i64>
    llvm.br ^bb3
  ^bb2:  // pred: ^bb0
    llvm.br ^bb3
  ^bb3:  // 2 preds: ^bb1, ^bb2
    %3 = llvm.mlir.addressof @_entry_point_arrays : !llvm.ptr<array<2 x ptr<i8>>>
    %4 = llvm.bitcast %3 : !llvm.ptr<array<2 x ptr<i8>>> to !llvm.ptr<ptr<i8>>
    llvm.return %4 : !llvm.ptr<ptr<i8>>
  }
  llvm.func @omInputSignature(%arg0: !llvm.ptr<i8>) -> !llvm.ptr<i8> {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = llvm.mlir.constant(1 : i64) : i64
    %2 = llvm.alloca %1 x !llvm.ptr<i8> : (i64) -> !llvm.ptr<ptr<i8>>
    %3 = llvm.mlir.constant(0 : i64) : i64
    %4 = llvm.mlir.addressof @_entry_point_0 : !llvm.ptr<array<15 x i8>>
    %5 = llvm.getelementptr %4[%3, %3] : (!llvm.ptr<array<15 x i8>>, i64, i64) -> !llvm.ptr<i8>
    %6 = llvm.mlir.constant(15 : i64) : i64
    %7 = llvm.call @strncmp(%arg0, %5, %6) : (!llvm.ptr<i8>, !llvm.ptr<i8>, i64) -> i32
    %8 = llvm.icmp "eq" %7, %0 : i32
    llvm.cond_br %8, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    %9 = llvm.mlir.addressof @_entry_point_0_in_sig : !llvm.ptr<array<122 x i8>>
    %10 = llvm.bitcast %9 : !llvm.ptr<array<122 x i8>> to !llvm.ptr<i8>
    llvm.store %10, %2 : !llvm.ptr<ptr<i8>>
    llvm.br ^bb3
  ^bb2:  // pred: ^bb0
    %11 = llvm.mlir.null : !llvm.ptr<i8>
    llvm.return %11 : !llvm.ptr<i8>
  ^bb3:  // pred: ^bb1
    %12 = llvm.load %2 : !llvm.ptr<ptr<i8>>
    llvm.return %12 : !llvm.ptr<i8>
  }
  llvm.func @omOutputSignature(%arg0: !llvm.ptr<i8>) -> !llvm.ptr<i8> {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = llvm.mlir.constant(1 : i64) : i64
    %2 = llvm.alloca %1 x !llvm.ptr<i8> : (i64) -> !llvm.ptr<ptr<i8>>
    %3 = llvm.mlir.constant(0 : i64) : i64
    %4 = llvm.mlir.addressof @_entry_point_0 : !llvm.ptr<array<15 x i8>>
    %5 = llvm.getelementptr %4[%3, %3] : (!llvm.ptr<array<15 x i8>>, i64, i64) -> !llvm.ptr<i8>
    %6 = llvm.mlir.constant(15 : i64) : i64
    %7 = llvm.call @strncmp(%arg0, %5, %6) : (!llvm.ptr<i8>, !llvm.ptr<i8>, i64) -> i32
    %8 = llvm.icmp "eq" %7, %0 : i32
    llvm.cond_br %8, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    %9 = llvm.mlir.addressof @_entry_point_0_out_sig : !llvm.ptr<array<60 x i8>>
    %10 = llvm.bitcast %9 : !llvm.ptr<array<60 x i8>> to !llvm.ptr<i8>
    llvm.store %10, %2 : !llvm.ptr<ptr<i8>>
    llvm.br ^bb3
  ^bb2:  // pred: ^bb0
    %11 = llvm.mlir.null : !llvm.ptr<i8>
    llvm.return %11 : !llvm.ptr<i8>
  ^bb3:  // pred: ^bb1
    %12 = llvm.load %2 : !llvm.ptr<ptr<i8>>
    llvm.return %12 : !llvm.ptr<i8>
  }
}
