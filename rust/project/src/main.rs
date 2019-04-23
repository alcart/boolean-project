#![feature(box_syntax)]

use rayon::iter::ParallelIterator;
use std::time::Instant;
use truth_tester::{
    state::{Bool as S, State},
    FnTester,
};

fn test_par<F: Fn(&S) -> bool + Send + Sync>(count: usize, expr: F) -> u128 {
    let tester = FnTester::new(count, &expr);
    let start = Instant::now();
    tester
        .successes_par()
        .for_each(|s| /* Do something */ {S::default(s.var_count());});

    start.elapsed().as_nanos()
}

fn test_lin<F: Fn(&S) -> bool + Send + Sync>(count: usize, expr: F) -> u128 {
    let tester = FnTester::new(count, expr);
    let start = Instant::now();
    tester
        .successes()
        .for_each(|s| /* Do something */ {S::default(s.var_count());});

    start.elapsed().as_nanos()
}

fn main() {
    type EFn = Fn(&S) -> bool + Send + Sync;

    let fns: Vec<(usize, Box<EFn>)> = vec![include!("expr.rs.txt")];

    for _ in 0..10 {
        for (i, (size, func)) in fns.iter().enumerate() {
            if *size >= 45 {
                continue;
            }

            print!("PAR,{},{},", i + 1, size);
            let par = test_par(*size, &**func);
            println!("{}", par);

            if *size < 35 {
                print!("LIN,{},{},", i + 1, size);
                let lin = test_lin(*size, &**func);
                println!("{}", lin);
            }
        }
    }
}
