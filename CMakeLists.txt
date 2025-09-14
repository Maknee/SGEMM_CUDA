cmake_minimum_required(VERSION 3.19)
project(NVIDIA_SGEMM_PRACTICE LANGUAGES CXX CUDA)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

find_package(CUDA REQUIRED)

# ensure cuda is available
include(CheckLanguage)
check_language(CUDA)

set(CMAKE_CXX_STANDARD 20)
set(CUDA_COMPUTE_CAPABILITY 86)

# in debug mode, add debug symbols to device code
# this disables most optimizations and kills performance
add_compile_options("$<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:CUDA>>:-G;-src-in-ptx>")
# add_compile_options("--ptxas-options=-v")

# Configure header file search paths
include_directories(${CUDA_INCLUDE_DIRS})
include_directories(${PROJECT_SOURCE_DIR}/src)
# Configure the source file path to be compiled
aux_source_directory(${PROJECT_SOURCE_DIR}/src SRC)

# generate main executable with all kernels (for compatibility)
add_executable(sgemm sgemm.cu ${SRC})
set_target_properties(sgemm PROPERTIES CUDA_ARCHITECTURES ${CUDA_COMPUTE_CAPABILITY})
target_link_libraries(sgemm ${CUDA_LIBRARIES} ${CUDA_CUBLAS_LIBRARIES})

# generate individual kernel executables for independent benchmarking
add_executable(sgemm_kernel_0 sgemm.cu ${SRC})
set_target_properties(sgemm_kernel_0 PROPERTIES CUDA_ARCHITECTURES ${CUDA_COMPUTE_CAPABILITY})
target_compile_definitions(sgemm_kernel_0 PRIVATE KERNEL_0=1 FIXED_KERNEL_NUM=0)
target_link_libraries(sgemm_kernel_0 ${CUDA_LIBRARIES} ${CUDA_CUBLAS_LIBRARIES})

add_executable(sgemm_kernel_1 sgemm.cu ${SRC})
set_target_properties(sgemm_kernel_1 PROPERTIES CUDA_ARCHITECTURES ${CUDA_COMPUTE_CAPABILITY})
target_compile_definitions(sgemm_kernel_1 PRIVATE KERNEL_1=1 FIXED_KERNEL_NUM=1)
target_link_libraries(sgemm_kernel_1 ${CUDA_LIBRARIES} ${CUDA_CUBLAS_LIBRARIES})

add_executable(sgemm_kernel_2 sgemm.cu ${SRC})
set_target_properties(sgemm_kernel_2 PROPERTIES CUDA_ARCHITECTURES ${CUDA_COMPUTE_CAPABILITY})
target_compile_definitions(sgemm_kernel_2 PRIVATE KERNEL_2=1 FIXED_KERNEL_NUM=2)
target_link_libraries(sgemm_kernel_2 ${CUDA_LIBRARIES} ${CUDA_CUBLAS_LIBRARIES})

add_executable(sgemm_kernel_3 sgemm.cu ${SRC})
set_target_properties(sgemm_kernel_3 PROPERTIES CUDA_ARCHITECTURES ${CUDA_COMPUTE_CAPABILITY})
target_compile_definitions(sgemm_kernel_3 PRIVATE KERNEL_3=1 FIXED_KERNEL_NUM=3)
target_link_libraries(sgemm_kernel_3 ${CUDA_LIBRARIES} ${CUDA_CUBLAS_LIBRARIES})

add_executable(sgemm_kernel_4 sgemm.cu ${SRC})
set_target_properties(sgemm_kernel_4 PROPERTIES CUDA_ARCHITECTURES ${CUDA_COMPUTE_CAPABILITY})
target_compile_definitions(sgemm_kernel_4 PRIVATE KERNEL_4=1 FIXED_KERNEL_NUM=4)
target_link_libraries(sgemm_kernel_4 ${CUDA_LIBRARIES} ${CUDA_CUBLAS_LIBRARIES})

add_executable(sgemm_kernel_5 sgemm.cu ${SRC})
set_target_properties(sgemm_kernel_5 PROPERTIES CUDA_ARCHITECTURES ${CUDA_COMPUTE_CAPABILITY})
target_compile_definitions(sgemm_kernel_5 PRIVATE KERNEL_5=1 FIXED_KERNEL_NUM=5)
target_link_libraries(sgemm_kernel_5 ${CUDA_LIBRARIES} ${CUDA_CUBLAS_LIBRARIES})

add_executable(sgemm_kernel_6 sgemm.cu ${SRC})
set_target_properties(sgemm_kernel_6 PROPERTIES CUDA_ARCHITECTURES ${CUDA_COMPUTE_CAPABILITY})
target_compile_definitions(sgemm_kernel_6 PRIVATE KERNEL_6=1 FIXED_KERNEL_NUM=6)
target_link_libraries(sgemm_kernel_6 ${CUDA_LIBRARIES} ${CUDA_CUBLAS_LIBRARIES})

add_executable(sgemm_kernel_7 sgemm.cu ${SRC})
set_target_properties(sgemm_kernel_7 PROPERTIES CUDA_ARCHITECTURES ${CUDA_COMPUTE_CAPABILITY})
target_compile_definitions(sgemm_kernel_7 PRIVATE KERNEL_7=1 FIXED_KERNEL_NUM=7)
target_link_libraries(sgemm_kernel_7 ${CUDA_LIBRARIES} ${CUDA_CUBLAS_LIBRARIES})

add_executable(sgemm_kernel_8 sgemm.cu ${SRC})
set_target_properties(sgemm_kernel_8 PROPERTIES CUDA_ARCHITECTURES ${CUDA_COMPUTE_CAPABILITY})
target_compile_definitions(sgemm_kernel_8 PRIVATE KERNEL_8=1 FIXED_KERNEL_NUM=8)
target_link_libraries(sgemm_kernel_8 ${CUDA_LIBRARIES} ${CUDA_CUBLAS_LIBRARIES})

add_executable(sgemm_kernel_9 sgemm.cu ${SRC})
set_target_properties(sgemm_kernel_9 PROPERTIES CUDA_ARCHITECTURES ${CUDA_COMPUTE_CAPABILITY})
target_compile_definitions(sgemm_kernel_9 PRIVATE KERNEL_9=1 FIXED_KERNEL_NUM=9)
target_link_libraries(sgemm_kernel_9 ${CUDA_LIBRARIES} ${CUDA_CUBLAS_LIBRARIES})

add_executable(sgemm_kernel_10 sgemm.cu ${SRC})
set_target_properties(sgemm_kernel_10 PROPERTIES CUDA_ARCHITECTURES ${CUDA_COMPUTE_CAPABILITY})
target_compile_definitions(sgemm_kernel_10 PRIVATE KERNEL_10=1 FIXED_KERNEL_NUM=10)
target_link_libraries(sgemm_kernel_10 ${CUDA_LIBRARIES} ${CUDA_CUBLAS_LIBRARIES})

add_executable(sgemm_kernel_11 sgemm.cu ${SRC})
set_target_properties(sgemm_kernel_11 PROPERTIES CUDA_ARCHITECTURES ${CUDA_COMPUTE_CAPABILITY})
target_compile_definitions(sgemm_kernel_11 PRIVATE KERNEL_11=1 FIXED_KERNEL_NUM=11)
target_link_libraries(sgemm_kernel_11 ${CUDA_LIBRARIES} ${CUDA_CUBLAS_LIBRARIES})

add_executable(sgemm_kernel_12 sgemm.cu ${SRC})
set_target_properties(sgemm_kernel_12 PROPERTIES CUDA_ARCHITECTURES ${CUDA_COMPUTE_CAPABILITY})
target_compile_definitions(sgemm_kernel_12 PRIVATE KERNEL_12=1 FIXED_KERNEL_NUM=12)
target_link_libraries(sgemm_kernel_12 ${CUDA_LIBRARIES} ${CUDA_CUBLAS_LIBRARIES})

add_executable(cuBLAS_sgemm cuBLAS_sgemm.cu )
set_target_properties(cuBLAS_sgemm PROPERTIES CUDA_ARCHITECTURES ${CUDA_COMPUTE_CAPABILITY})
target_link_libraries(cuBLAS_sgemm ${CUDA_LIBRARIES} ${CUDA_CUBLAS_LIBRARIES})

add_executable(simplest_kernel simplest_kernel.cu)
set_target_properties(simplest_kernel PROPERTIES CUDA_ARCHITECTURES ${CUDA_COMPUTE_CAPABILITY})
target_link_libraries(simplest_kernel ${CUDA_LIBRARIES})