
__global__ void gpu_boolean_matcher(char* result, int index) {
   
  long element = (((long)blockIdx.x)*((long)blockDim.x) + ((long)threadIdx.x)); // maxes out at 2^42 - 1
  long maxCores = 1 << 42;

   switch(index){
     case {IDX}:
	for(long i = element; i < (1 << {VAR_COUNT}); i += maxCores) {          
	  result = result && ({EXPR});
        }
	break;
   }
}
