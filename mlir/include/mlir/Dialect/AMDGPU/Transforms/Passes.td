//===-- Passes.td - AMDGPU pass declarations ----*- tablegen -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file declares the passes for the AMDGPU Dialect in MLIR.
//
//===----------------------------------------------------------------------===//

#ifndef MLIR_DIALECT_AMDGPU_TRANSFORMS_PASSES_TD_
#define MLIR_DIALECT_AMDGPU_TRANSFORMS_PASSES_TD_

include "mlir/Pass/PassBase.td"

def AmdgpuEmulateAtomicsPass : Pass<"amdgpu-emulate-atomics"> {
  let summary = "Emulate atomic operations on chipsets that do not support them";
  let description = [{
    This pass rewrites any AMDGPU-specific atomic operation that is not supported
    on the given `chipset` into a compare-and-swap loop.
  }];
  let dependentDialects = [
    "cf::ControlFlowDialect",
    "arith::ArithDialect",
    "vector::VectorDialect"
  ];
  let options = [Option<"chipset", "chipset", "std::string",
                        /*default=*/"\"gfx000\"",
                        "Chipset that these operations will run on">];
}

#endif // MLIR_DIALECT_AMDGPU_TRANSFORMS_PASSES_TD_
