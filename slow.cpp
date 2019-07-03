#include <iostream>
#include <stdio.h>
#include <time.h>
#define N (512*512)
#define M (10000)
int main()
{
   float data[N]; int count = 0;
   for(int i = 0; i < N; i++)
   {
      data[i] = 1.0f * i / N;
      for(int j = 0; j < M; j++)
      {
         data[i] = data[i] * data[i] - 0.25f;
      }
   }
}
