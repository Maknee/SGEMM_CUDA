#pragma once

#include <cuda_runtime.h>
#include <cublas_v2.h>

// Common macros used across kernels
#define CEIL_DIV(M, N) (((M) + (N)-1) / (N))
#define WARPSIZE 32

// Common function declarations
void cudaCheck(cudaError_t error, const char *file, int line);
void runCublasFP32(cublasHandle_t handle, int M, int N, int K, float alpha,
                   float *A, float *B, float beta, float *C);