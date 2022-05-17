/*
 * SPDX-License-Identifier: Apache-2.0
 */

// former version
// #include "onnx-mlir/Runtime/OnnxDataType.h"

// for rv64 compile
#include "../../include/onnx-mlir/Runtime/OnnxDataType.h"

const int OM_DATA_TYPE_SIZE[] = {
#define OM_TYPE_METADATA_DEF(ENUM_NAME, ENUM_VAL, DTYPE_SIZE, DTYPE_NAME)      \
  DTYPE_SIZE,
// former version
// #include "onnx-mlir/Runtime/OnnxDataTypeMetaData.inc"

// for rv64 compile 
#include "../../include/onnx-mlir/Runtime/OnnxDataTypeMetaData.inc"


#undef OM_TYPE_METADATA_DEF
};

const char *OM_DATA_TYPE_NAME[] = {
#define OM_TYPE_METADATA_DEF(ENUM_NAME, ENUM_VAL, DTYPE_SIZE, DTYPE_NAME)      \
  DTYPE_NAME,
// former version
#include "onnx-mlir/Runtime/OnnxDataTypeMetaData.inc"
// for rv64 compile 
// #include "../../include/onnx-mlir/Runtime/OnnxDataTypeMetaData.inc"



#undef OM_TYPE_METADATA_DEF
};
