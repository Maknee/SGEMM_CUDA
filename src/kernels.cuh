#pragma once

#include "common.cuh"

// Define helper macro for cleaner conditional compilation
#define NO_KERNEL_DEFINED (!defined(KERNEL_0) && !defined(KERNEL_1) && !defined(KERNEL_2) && !defined(KERNEL_3) && !defined(KERNEL_4) && !defined(KERNEL_5) && !defined(KERNEL_6) && !defined(KERNEL_7) && !defined(KERNEL_8) && !defined(KERNEL_9) && !defined(KERNEL_10) && !defined(KERNEL_11) && !defined(KERNEL_12))

// Include kernels based on compile-time defines
// If no specific kernel is defined, include all (original behavior)

// Include kernels based on compile-time defines for selective compilation
#if defined(KERNEL_1) || defined(KERNEL_ALL) || NO_KERNEL_DEFINED
#include "kernels/1_naive.cuh"
#endif

#if defined(KERNEL_2) || defined(KERNEL_ALL) || NO_KERNEL_DEFINED
#include "kernels/2_kernel_global_mem_coalesce.cuh"
#endif

#if defined(KERNEL_3) || defined(KERNEL_ALL) || NO_KERNEL_DEFINED
#include "kernels/3_kernel_shared_mem_blocking.cuh"
#endif

#if defined(KERNEL_4) || defined(KERNEL_ALL) || NO_KERNEL_DEFINED
#include "kernels/4_kernel_1D_blocktiling.cuh"
#endif

#if defined(KERNEL_5) || defined(KERNEL_ALL) || NO_KERNEL_DEFINED
#include "kernels/5_kernel_2D_blocktiling.cuh"
#endif

#if defined(KERNEL_6) || defined(KERNEL_ALL) || NO_KERNEL_DEFINED
#include "kernels/6_kernel_vectorize.cuh"
#endif

#if defined(KERNEL_7) || defined(KERNEL_ALL) || NO_KERNEL_DEFINED
#include "kernels/7_kernel_resolve_bank_conflicts.cuh"
#endif

#if defined(KERNEL_8) || defined(KERNEL_ALL) || NO_KERNEL_DEFINED
#include "kernels/8_kernel_bank_extra_col.cuh"
#endif

#if defined(KERNEL_9) || defined(KERNEL_ALL) || NO_KERNEL_DEFINED
#include "kernels/9_kernel_autotuned.cuh"
#endif

#if defined(KERNEL_10) || defined(KERNEL_ALL) || NO_KERNEL_DEFINED
#include "kernels/10_kernel_warptiling.cuh"
#endif

#if defined(KERNEL_11) || defined(KERNEL_ALL) || NO_KERNEL_DEFINED
#include "kernels/11_kernel_double_buffering.cuh"
#endif

#if defined(KERNEL_12) || defined(KERNEL_ALL) || NO_KERNEL_DEFINED
#include "kernels/12_kernel_double_buffering.cuh"
#endif