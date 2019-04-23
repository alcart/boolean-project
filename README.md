# boolean-project
CDA4101 Final Project. Matches boolean expressions using multicore, parallelism and CUDA strategies to improve its runtime.

In this repository we keep the CUDA parts, as the multicore and linear versions are in a separate repository.

To run CUDA version run this commands in the terminal: 
```
set NVCC=/usr/local/cuda-9.1/bin/nvcc
```
Sets a variable NVCC to the path of the cuda compiler, then:
```
$NVCC -arch=sm_37 tester.cu -o tester
```
This will compile the code and then run it with:
```
./tester
```

For all the rust code, you will need `cargo` Rust's package manager. This can easily be obtained from [rustup](https://rustup.rs/).
After doing so, all that is needed is `cargo run` inside each of the folders under the rust folder. As all the dependencies are managed through Cargo.
