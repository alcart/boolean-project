use std::fs::File;
use std::io::Read;
use std::collections::btree_map::BTreeMap;

fn main() {
    let mut args = std::env::args();
    args.next();

    let mut file = File::open(&args.next().expect("No file passed")).expect("Unable to open file");
    let mut inp = String::new();
    file.read_to_string(&mut inp).expect("Unable to read file!");

    let mut map = BTreeMap::new();

    for (expr, cores, time) in inp.lines().map(|l| {
        let mut points = l.split_terminator(",");
        let expr = points.nth(1).expect("No expr").parse::<usize>().expect("Not a Number (expr)");
        let cores = points.nth(1).expect("No cores").parse::<usize>().expect("Not a Number (cores)");
        let time = points.nth(0).expect("No time").parse::<u128>().expect("Not a Number (time)");
        (expr, cores, time)
    }) {
        let (t, n) = map.entry((expr, cores)).or_insert((time, 1usize));
        if *t != time {
            *t += time;
            *n += 1;
        }
    }

    for ((expr, cores), (time, count)) in map {
        println!("{},{},{}", expr, cores, (time / count as u128));
    }
}