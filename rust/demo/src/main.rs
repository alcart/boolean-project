use std::io::{stdin, BufRead, StdinLock};
use truth_tester::testers::expression::boolean::Tester;

fn test_expression(mut inp: &mut String, handle: &mut StdinLock) {
    println!("Please input your function:");
    // Reset the input before reading
    inp.clear();
    // read user input
    handle
        .read_line(&mut inp)
        .expect("unable to read user input");

    println!(
        "\tYour expression is {}",
        if Tester::parse(&inp).succeeded() {
            "true"
        } else {
            "false"
        }
    );
}

fn main() {
    // create all the variables that live longer
    // than a single loop iteration
    let stdin = stdin();
    let mut handle = stdin.lock();
    let mut inp = String::new();

    loop {
        test_expression(&mut inp, &mut handle);

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
