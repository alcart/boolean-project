#include <sys/time.h>
#include <stdio.h>
#include <signal.h> 
#include "gpu_boolean.cu"

struct timeval start, end;
FILE* data;

long max_iterations(int index);
void starttime() {
  gettimeofday( &start, 0);
}

double endtime() {
  gettimeofday( &end, 0);
  double elapsed = ( end.tv_sec - start.tv_sec) * 1000.0 + (end.tv_usec - start.tv_usec) / 1000.0;
  return elapsed;
}

void handle_sigint(int sig) {
  if (sig == SIGTERM || sig == SIGINT) {
    if (data) fclose(data);
  }
  signal (sig, SIG_DFL);
  raise (sig); 
}

void test() {
  data = fopen("./data.csv", "w");
  //Save data to file
  fputs("Operation,Number of iterations,Number of cores,Runtime\n", data);
  //Output data to console
  printf("Operation\tNumber of iterations\tNumber of cores\tRuntime\n"); 
  
  //Run through all expressions
  for (int i = 1; i <= 59; i++) {
    int numThreads = 1024;
    long maxIterations = max_iterations(i);

    for (int k = 4; k >= 0; k--) {
      int total_runs = 5;
      long numCores = maxIterations/(numThreads*k + 1);
      if (numCores == 0) numCores = 1;
      
      if (numCores >= ((long)2 << 41))
         numCores = (long)2 << 41;
      
      //Save data to file
      fprintf(data, "%d,%ld,%ld,", i, maxIterations, numCores); 
      //Output data to console
      printf("%d\t%ld\t%ld\t", i, maxIterations, numCores); 
      double elapsed_total_tests = 0; 
      // Run 5 tests 
      for (int j = 0; j < total_runs; j++) {
        starttime();
        //Cuda code
        char* gpuResult;
        char result = 1;
        cudaMalloc(&gpuResult, sizeof(char));
        cudaMemcpy(gpuResult, &result, sizeof(char), cudaMemcpyHostToDevice);
        gpu_boolean_matcher<<<numCores, numThreads>>>(gpuResult, i);
        cudaMemcpy(&result, gpuResult, sizeof(char), cudaMemcpyDeviceToHost);
        cudaFree(&gpuResult);
        elapsed_total_tests += endtime();
      }
      
      double average_runtime = elapsed_total_tests/total_runs;
     
      //Save data to file
      fprintf(data, "%f ms\n", average_runtime);
      //Output data to console
      printf("%f ms\n", average_runtime);
      fflush(stdout);
      fflush(data);
    }
    //Print total_runtime with cores
  } 
  fclose(data);
}

long max_iterations(int index) {
  
    switch (index) {
	// Expression #1, Amount of variables: 2
	case 1:
	    return (((long) 1) << 2);
	// Expression #2, Amount of variables: 2
	case 2:
	    return (((long) 1) << 2);
	// Expression #3, Amount of variables: 2
	case 3:
	    return (((long) 1) << 2);
	// Expression #4, Amount of variables: 3
	case 4:
	    return (((long) 1) << 3);
	// Expression #5, Amount of variables: 4
	case 5:
	    return (((long) 1) << 4);
	// Expression #6, Amount of variables: 5
	case 6:
	    return (((long) 1) << 5);
	// Expression #7, Amount of variables: 20
	case 7:
	    return (((long) 1) << 20);
	// Expression #8, Amount of variables: 21
	case 8:
	    return (((long) 1) << 21);
	// Expression #9, Amount of variables: 25
	case 9:
	    return (((long) 1) << 25);
	// Expression #10, Amount of variables: 21
	case 10:
	    return (((long) 1) << 21);
	// Expression #11, Amount of variables: 30
	case 11:
	    return (((long) 1) << 30);
	// Expression #12, Amount of variables: 21
	case 12:
	    return (((long) 1) << 21);
	// Expression #13, Amount of variables: 39
	case 13:
	    return (((long) 1) << 39);
	// Expression #14, Amount of variables: 45
	case 14:
	    return (((long) 1) << 45);
	// Expression #15, Amount of variables: 50
	case 15:
	    return (((long) 1) << 50);
	// Expression #16, Amount of variables: 60
	case 16:
	    return (((long) 1) << 60);
	// Expression #17, Amount of variables: 61
	case 17:
	    return (((long) 1) << 61);
	// Expression #18, Amount of variables: 60
	case 18:
	    return (((long) 1) << 60);
	// Expression #19, Amount of variables: 62
	case 19:
	    return (((long) 1) << 62);
	// Expression #20, Amount of variables: 60
	case 20:
	    return (((long) 1) << 60);
	// Expression #21, Amount of variables: 63
	case 21:
	    return (((long) 1) << 63);
	// Expression #22, Amount of variables: 2
	case 22:
	    return (((long) 1) << 2);
	// Expression #23, Amount of variables: 4
	case 23:
	    return (((long) 1) << 4);
	// Expression #24, Amount of variables: 5
	case 24:
	    return (((long) 1) << 5);
	// Expression #25, Amount of variables: 8
	case 25:
	    return (((long) 1) << 8);
	// Expression #26, Amount of variables: 9
	case 26:
	    return (((long) 1) << 9);
	// Expression #27, Amount of variables: 12
	case 27:
	    return (((long) 1) << 12);
	// Expression #28, Amount of variables: 10
	case 28:
	    return (((long) 1) << 10);
	// Expression #29, Amount of variables: 12
	case 29:
	    return (((long) 1) << 12);
	// Expression #30, Amount of variables: 16
	case 30:
	    return (((long) 1) << 16);
	// Expression #31, Amount of variables: 18
	case 31:
	    return (((long) 1) << 18);
	// Expression #32, Amount of variables: 18
	case 32:
	    return (((long) 1) << 18);
	// Expression #33, Amount of variables: 21
	case 33:
	    return (((long) 1) << 21);
	// Expression #34, Amount of variables: 24
	case 34:
	    return (((long) 1) << 24);
	// Expression #35, Amount of variables: 26
	case 35:
	    return (((long) 1) << 26);
	// Expression #36, Amount of variables: 28
	case 36:
	    return (((long) 1) << 28);
	// Expression #37, Amount of variables: 29
	case 37:
	    return (((long) 1) << 29);
	// Expression #38, Amount of variables: 27
	case 38:
	    return (((long) 1) << 27);
	// Expression #39, Amount of variables: 29
	case 39:
	    return (((long) 1) << 29);
	// Expression #40, Amount of variables: 31
	case 40:
	    return (((long) 1) << 31);
	// Expression #41, Amount of variables: 34
	case 41:
	    return (((long) 1) << 34);
	// Expression #42, Amount of variables: 35
	case 42:
	    return (((long) 1) << 35);
	// Expression #43, Amount of variables: 36
	case 43:
	    return (((long) 1) << 36);
	// Expression #44, Amount of variables: 40
	case 44:
	    return (((long) 1) << 40);
	// Expression #45, Amount of variables: 39
	case 45:
	    return (((long) 1) << 39);
	// Expression #46, Amount of variables: 42
	case 46:
	    return (((long) 1) << 42);
	// Expression #47, Amount of variables: 43
	case 47:
	    return (((long) 1) << 43);
	// Expression #48, Amount of variables: 43
	case 48:
	    return (((long) 1) << 43);
	// Expression #49, Amount of variables: 41
	case 49:
	    return (((long) 1) << 41);
	// Expression #50, Amount of variables: 40
	case 50:
	    return (((long) 1) << 40);
	// Expression #51, Amount of variables: 51
	case 51:
	    return (((long) 1) << 51);
	// Expression #52, Amount of variables: 52
	case 52:
	    return (((long) 1) << 52);
	// Expression #53, Amount of variables: 54
	case 53:
	    return (((long) 1) << 54);
	// Expression #54, Amount of variables: 47
	case 54:
	    return (((long) 1) << 47);
	// Expression #55, Amount of variables: 55
	case 55:
	    return (((long) 1) << 55);
	// Expression #56, Amount of variables: 60
	case 56:
	    return (((long) 1) << 60);
	// Expression #57, Amount of variables: 57
	case 57:
	    return (((long) 1) << 57);
	// Expression #58, Amount of variables: 58
	case 58:
	    return (((long) 1) << 58);
	// Expression #59, Amount of variables: 61
	case 59:
	    return (((long) 1) << 61);	
      }
      return 0; // Should not happen
}

int main() {
 signal(SIGINT, handle_sigint); 
 test();
 return 0;
}
