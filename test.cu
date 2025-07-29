#include <cuda_runtime.h>
#include <stdio.h>

__global__ void hello_kernel() {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    printf("Hello from GPU thread %d\n", idx);
}

int main() {
    printf("Testing CUDA on Jetson...\n");
    
    hello_kernel<<<2, 4>>>();
    cudaDeviceSynchronize();
    
    printf("CUDA test complete.\n");
    return 0;
}