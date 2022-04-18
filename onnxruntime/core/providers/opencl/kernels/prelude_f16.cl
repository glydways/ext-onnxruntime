// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License.

// This file will be prepended to kernel

#pragma OPENCL EXTENSION cl_khr_fp16 : enable

// The following line contribute one sample point to support the opinion: "Every OpenCL compiler is a bug ridden C
// compiler". It causes: error: internal error: could not emit constant value "abstractly"
#ifndef CONFORMANCE_WORKAROUND_could_not_emit_constant_value_abstractly
__constant sampler_t SAMPLER = CLK_NORMALIZED_COORDS_FALSE | CLK_ADDRESS_CLAMP | CLK_FILTER_NEAREST;
#else
#define SAMPLER 14 // manually constant folded (CLK_NORMALIZED_COORDS_FALSE | CLK_ADDRESS_CLAMP | CLK_FILTER_NEAREST)
#endif

#define SELECT_PREDICATE short  // this is for select predicate cast
#define FLOAT half
#define FLOAT4 half4
#define CONVERT_FLOAT convert_half
#define CONVERT_FLOAT4 convert_half4
#define RI_F(image, coord) read_imageh((image), (SAMPLER), (coord))
#define WI_F(image, coord, value) write_imageh((image), (coord), (value))
