#define N (512*512)
#define M (10000)
#include <stdio.h>

__global__ void cudakernel(float *buf)
{
   int i = threadIdx.x + blockIdx.x * blockDim.x;
   buf[i] = 1.0f * i / N;
   for(int j = 0; j < M; j++)
      buf[i] = buf[i] * buf[i] - 0.25f;
}

int main()
{
   float data[N];
   float *d_data;
   cudaMalloc(&d_data, N * sizeof(float));
   cudakernel<<<N/256, 256>>>(d_data);
   cudaMemcpy(data, d_data, N * sizeof(float), cudaMemcpyDeviceToHost);
   cudaFree(d_data); 

}
