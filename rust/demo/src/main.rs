use std::io::{stdin, BufRead, StdinLock};
use truth_tester::{
    state::Bool as S,
    testers::expression::boolean::{Parser, Tester, Token},
    FnTester,
};

fn test_expression(mut inp: &mut String, handle: &mut StdinLock) {
    println!("Please input your function:");
    // Reset the input before reading
    inp.clear();
    // read user input
    handle
        .read_line(&mut inp)
        .expect("unable to read user input");

    // Parse the given input
    let mut parser = Parser::new(&inp);
    // Pass it through the Shunting Yard algorithim
    // so that the Tester can understand it
    let tokens = parser.shunting_yard();
    println!("This is what was parsed: {:?}", tokens);

    // Execute a test of the expression in linear fashion
    println!("Linear test");
    let toks = tokens.clone();
    let start = std::time::Instant::now();
    let _ = Tester::new(toks).succeeded();
    let end = std::time::Instant::now();
    println!("\tDuration: {:>25} ns", (end - start).as_nanos());

    #[cfg(feature = "parallel")]
    fn parallel(tokens: Vec<Token>) {
        // Execute a test of the expression in parallel
        println!("Parallel test");
        let start = std::time::Instant::now();
        let _ = Tester::new(tokens).succeeded_par();
        let end = std::time::Instant::now();
        println!("\tDuration: {:>25} ns", (end - start).as_nanos());
    }

    #[cfg(not(feature = "parallel"))]
    fn parallel(_: Vec<Token>) {
        // Do nothing as the `parallel` feature is disabled
    }

    // Execute the parallel test, or do nothing if
    // the feature is disabled
    parallel(tokens.clone());

    #[cfg(feature = "cuda")]
    fn cuda(tokens: Vec<Token>) {
        // Execute a test of the expression using CUDA
        println!("CUDA test");
        let start = std::time::Instant::now();
        let _ = Tester::passes_cuda(tokens);
        let end = std::time::Instant::now();
        println!("\tDuration: {:>25} ns", (end - start).as_nanos());
    }

    #[cfg(not(feature = "cuda"))]
    fn cuda(_: Vec<Token>) {
        // Do nothing as the `cuda` feature is disabled
    }

    // Execute the cuda test, or do nothing if
    // the feature is disabled
    cuda(tokens);
}

fn test_time(mut inp: &mut String, handle: &mut StdinLock) {
    // Dynamically obtain how many variables to test with
    println!("How many variables should we test with? (amount can not be >= pointer size)");
    // Reset the input before reading
    inp.clear();
    // read user input
    handle
        .read_line(&mut inp)
        .expect("unable to read user input");
    // parse the input into a number
    let var_count: usize = inp
        .split_whitespace()
        .next()
        .and_then(|v| v.parse().ok())
        .expect("unable to parse user input");

    if var_count >= (std::mem::size_of::<usize>() * 8) {
        println!(
                "The inputed amount of variables `{}` is greater or equal to your machine's pointer size `{}`",
                var_count,
                std::mem::size_of::<usize>() * 8
            );
        return;
    }

    // Execute a test that can't fail so that we see the worse case scenario
    // time for linear execution
    println!("Linear test with {} variables", var_count);
    let start = std::time::Instant::now();
    let _ = FnTester::passes(var_count, |_: &S| true);
    let end = std::time::Instant::now();
    println!("\tDuration: {:>25} ns", (end - start).as_nanos());

    #[cfg(feature = "parallel")]
    fn parallel(var_count: usize) {
        // Execute a test that can't fail so that we see the worse case scenario
        // time for parallel execution
        println!("Parallel test with {} variables", var_count);
        let start = std::time::Instant::now();
        let _ = FnTester::passes_par(var_count, |_: &S| true);
        let end = std::time::Instant::now();
        println!("\tDuration: {:>25} ns", (end - start).as_nanos());
    }

    #[cfg(not(feature = "parallel"))]
    fn parallel(_: usize) {
        // Do nothing as the `parallel` feature is disabled
    }

    // Execute the parallel test, or do nothing if
    // the feature is disabled
    parallel(var_count);

    #[cfg(feature = "cuda")]
    fn cuda(var_count: usize) {
        // Execute a test that can't fail so that we see the worse case scenario
        // time for CUDA execution
        println!("CUDA test with {} variables", var_count);
        let start = std::time::Instant::now();
        let _ = FnTester::passes_cuda(var_count, |_: &S| true);
        let end = std::time::Instant::now();
        println!("\tDuration: {:>25} ns", (end - start).as_nanos());
    }

    #[cfg(not(feature = "cuda"))]
    fn cuda(_: usize) {
        // Do nothing as the `cuda` feature is disabled
    }

    // Execute the cuda test, or do nothing if
    // the feature is disabled
    cuda(var_count);
}

fn main() {
    // create all the variables that live longer
    // than a single loop iteration
    let stdin = stdin();
    let mut handle = stdin.lock();
    let mut inp = String::new();

    loop {
        println!("Would you like to test an amount of variables, on a programatically written function (p), or your own function (m)? (P/m)");
        // Reset the input before reading
        inp.clear();
        // read user input
        handle
            .read_line(&mut inp)
            .expect("unable to read user input");

        let ans = inp.split_whitespace().next();
        if let Some("m") = ans {
            test_expression(&mut inp, &mut handle);
        } else {
            test_time(&mut inp, &mut handle);
        }

        // Check if we want to continue
        println!("\nDo you wish to continue? (Y/n)");

        // Reset the input before reading
        inp.clear();
        // read the answer
        handle
            .read_line(&mut inp)
            .expect("unable to read user input");

        // exit the loop if the user inputed `n`
        let ans = inp.split_whitespace().next();
        if let Some(i) = ans {
            if i == "n" {
                break;
            }
        }
    }
}
