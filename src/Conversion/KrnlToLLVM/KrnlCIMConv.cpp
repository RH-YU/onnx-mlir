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

#include<sstream>
#define DEBUG_TYPE "krnl_to_llvm"

using namespace mlir;

namespace onnx_mlir {
namespace krnl {

template <typename Op>
struct CallFunctionName {
  static std::string functionName() {
    // std::string temp_ = op->getName().getStringRef().str();
    std::string name = "CIMConv";
    // std::string name = "CIMConv";
    return name; 
    };
};

template <typename KrnlCIMConvOp>
class KrnlCIMConvOpLowering : public ConversionPattern {
public:
  explicit KrnlCIMConvOpLowering(
      TypeConverter &typeConverter, MLIRContext *context)
      : ConversionPattern(
            typeConverter, KrnlCIMConvOp::getOperationName(), 1, context) {}

  LogicalResult matchAndRewrite(Operation *op, ArrayRef<Value> operands,
      ConversionPatternRewriter &rewriter) const override {
    MLIRContext *context = op->getContext();
    // std::cout << op << std::endl;
    Location loc = op->getLoc();

    // // get the LLVM type for the function args and result
    mlir::Type inType = op->getOperand(0).getType();
    mlir::Type llvmType;
    // if (inType.isF32())
    //   llvmType = FloatType::getF32(context);
    // else if (inType.isF64())
    //   llvmType = FloatType::getF64(context);
    llvmType = FloatType::getF32(context);

    // // Insert and/or get reference to elementary math function declaration.
    // assert(
    //     inType.isIntOrFloat() && "Type for math function must be int or float");
    ModuleOp parentModule = op->getParentOfType<ModuleOp>();
    auto callFunctionRef = getOrInsertCallFunction(op, rewriter, parentModule,
        CallFunctionName<KrnlCIMConvOp>().functionName(), llvmType);

    // Emit function call.
    // rewriter.replaceOpWithNewOp<LLVM::CallOp>(
    //     op, inType, callFunctionRef, operands[0]);
  
    // rewriter.create<CallOp>(loc, callFunctionRef, llvmType, args);
    rewriter.replaceOpWithNewOp<mlir::CallOp>(op, CallFunctionName<KrnlCIMConvOp>().functionName(),
                                              op->getResultTypes(),
                                              op->getOperands());
    // rewriter.replaceOp(op, funcCall.getResults());
    // rewriter.eraseOp(op);
    return success();
  }

private:
  // This function emits a declaration of the form:
  //
  // declare float <CallFuncName>(float)
  //
  FlatSymbolRefAttr getOrInsertCallFunction(Operation *op, PatternRewriter &rewriter,
      ModuleOp module, std::string callFuncName, mlir::Type llvmType) const {
    auto *context = module.getContext();
    if (module.lookupSymbol<LLVM::LLVMFuncOp>(callFuncName))
      return SymbolRefAttr::get(context, callFuncName);

    // Create function declaration.
    // auto llvmF32Ty = FloatType::get(context);

    // auto llvmFnType =
    //     LLVM::LLVMFunctionType::get(llvmType, ArrayRef<mlir::Type>({llvmType}));
    
    SmallVector<Type, 4> inputTypes(op->getOperandTypes());
    auto libFnType = mlir::FunctionType::get(rewriter.getContext(), inputTypes, 
                                        op->getResultTypes());

    // Insert the call function into the body of the parent module.
    PatternRewriter::InsertionGuard insertGuard(rewriter);
    rewriter.setInsertionPointToStart(module.getBody());
    rewriter.create<FuncOp>(
        op->getLoc(), callFuncName, libFnType);
    return SymbolRefAttr::get(context, callFuncName);
  }
};

void populateLoweringKrnlCIMConvOpPattern(TypeConverter &typeConverter,
    RewritePatternSet &patterns, MLIRContext *ctx) {
  patterns.insert<KrnlCIMConvOpLowering<KrnlCIMConvOp>>(typeConverter, ctx);
}

} // namespace krnl
} // namespace onnx_mlir
