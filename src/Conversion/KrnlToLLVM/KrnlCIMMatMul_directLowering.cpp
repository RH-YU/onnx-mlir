/*
 * SPDX-License-Identifier: Apache-2.0
 */

//===------ KrnlCall.cpp - Lower KrnlCall Ops -------------------===//
//
//
// =============================================================================
//
// This file lowers the KrnlCall operators.
//
//===----------------------------------------------------------------------===//

#include "mlir/Conversion/LLVMCommon/Pattern.h"
#include "mlir/Conversion/LLVMCommon/TypeConverter.h"
#include "mlir/Dialect/LLVMIR/LLVMDialect.h"
#include "mlir/Dialect/StandardOps/IR/Ops.h"

#include "src/Conversion/KrnlToLLVM/ConvertKrnlToLLVM.hpp"
#include "src/Conversion/KrnlToLLVM/KrnlToLLVMHelper.hpp"
#include "src/Dialect/Krnl/KrnlHelper.hpp"
#include "src/Dialect/Krnl/KrnlOps.hpp"
#include "llvm/Support/Debug.h"

#include "mlir/Dialect/StandardOps/Transforms/FuncConversions.h"

#define DEBUG_TYPE "krnl_to_llvm"

using namespace mlir;

namespace onnx_mlir {
namespace krnl {

template <typename Op>
struct CallFunctionName {
  static std::string functionName() { return "CIMMatMul"; };
};

template <typename KrnlCIMMatMulOp>
class KrnlCIMMatMulOpLowering : public ConversionPattern {
public:
  explicit KrnlCIMMatMulOpLowering(
      TypeConverter &typeConverter, MLIRContext *context)
      : ConversionPattern(
            typeConverter, KrnlCIMMatMulOp::getOperationName(), 1, context) {}

  LogicalResult matchAndRewrite(Operation *op, ArrayRef<Value> operands,
      ConversionPatternRewriter &rewriter) const override {
    MLIRContext *context = op->getContext();
    Location loc = op->getLoc();

    // get the LLVM type for the function args and result
    mlir::Type inType = op->getOperand(0).getType();
    mlir::Type llvmType;
    // if (inType.isF32())
    //   llvmType = FloatType::getF32(context);
    // else if (inType.isF64())
    //   llvmType = FloatType::getF64(context);

    llvmType = FloatType::getF32(context);

    // Insert and/or get reference to elementary math function declaration.
    assert(
        inType.isIntOrFloat() && "Type for call function must be int or float");
    ModuleOp parentModule = op->getParentOfType<ModuleOp>();
    auto CallFunctionRef = getOrInsertCallFunction(rewriter, parentModule,
        CallFunctionName<KrnlCIMMatMulOp>().functionName(), llvmType);

    // Emit function call.
    // auto funcCall = rewriter.create<CallOp>(
    //     loc, CallFunctionRef, llvmType, ArrayRef<Value>({operands}));
    // rewriter.replaceOp(op, funcCall.getResults()[0]);
    // Value casted = rewriter.create<LLVM::BitcastOp>(
    //     op->getLoc(), getVoidPtrType(),
    //     memref.allocatedPtr(rewriter, op->getLoc()));

    rewriter.replaceOpWithNewOp<LLVM::CallOp>(op,ArrayRef<Type>(), 
                                              CallFunctionRef,
                                              operands);
    return success();
  }

private:
  // This function emits a declaration of the form:
  //
  // declare float <CallFuncName>(float)
  //
  FlatSymbolRefAttr getOrInsertCallFunction( PatternRewriter &rewriter,
      ModuleOp module, std::string callFuncName, mlir::Type llvmType) const {

    auto *context = module.getContext();
    if (module.lookupSymbol<LLVM::LLVMFuncOp>(callFuncName))
      return SymbolRefAttr::get(context, callFuncName);

    // Create function declaration.
    // auto llvmF32Ty = FloatType::get(context);
    auto llvmFnType =
        LLVM::LLVMFunctionType::get(llvmType, ArrayRef<mlir::Type>({llvmType}));

    // Insert the unary math function into the body of the parent module.
    PatternRewriter::InsertionGuard insertGuard(rewriter);
    rewriter.setInsertionPointToStart(module.getBody());
    rewriter.create<LLVM::LLVMFuncOp>(
        module.getLoc(), callFuncName, llvmFnType);
    return SymbolRefAttr::get(context, callFuncName);
  }
};

void populateLoweringKrnlCIMMatMulOpPattern(TypeConverter &typeConverter,
    RewritePatternSet &patterns, MLIRContext *ctx) {
  patterns.insert<KrnlCIMMatMulOpLowering<KrnlCIMMatMulOp>>(typeConverter, ctx);
}

} // namespace krnl
} // namespace onnx_mlir
