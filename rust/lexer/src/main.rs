use std::fs::File;
use std::io::Read;
use truth_tester::testers::expression::boolean::{
    Lexer, Parser,
    Token::{self, *},
};

fn main() {
    let mut args = std::env::args();
    args.next();

    let mut file = File::open(&args.next().expect("No file passed")).expect("Unable to open file");
    let mut inp = String::new();
    file.read_to_string(&mut inp).expect("Unable to read file!");
    let mut out = String::new();
    let mut expr = String::new();

    for (i, line) in inp.lines().enumerate() {
        expr.clear();

        // make sure the expression is valid
        //println!("// Checking expression number: {}...", i + 1);
        let _ = Parser::new(&line).shunting_yard();
        //println!("// Expression {} is fine", i + 1);
        let mut tokens = Lexer::new(&line).collect::<Vec<Token>>();
        let eof = tokens.pop().expect("Expected some EOF value");
        let eof = if let Token::EOF(v) = eof {
            v.to_string()
        } else {
            panic!("Expected EOF!")
        };

        for token in tokens {
            expr += &match token {
                // Var(_, i) => format!("getBits(i, {})", i), // C Version
                Var(_, i) => format!("s.var_at({})", i), // Rust Version
                And => "&&".to_owned(),
                Or => "||".to_owned(),
                Xor => "^".to_owned(),
                Equality => "==".to_owned(),
                Not => "!".to_owned(),
                LParen => "(".to_owned(),
                RParen => ")".to_owned(),
                s => panic!("Didn't expect symbol: `{:?}`!", s),
            }
        }
        //         // C var counts
        //         out += &format!(
        //             r##"
        // // Expression #{place}, Amount of variables: {var_count}
        // case {place}:
        //     return (((long) 1) << {var_count});"##,
        //             place = (i + 1),
        //             var_count = eof,
        //         );
        //         // C expression
        //                         out += &format!(
        //                 r##"
        // // Expression #{place}, Amount of variables: {var_count}
        // case {place}:
        //     for (long i = element; i < (((long) 1) << {var_count}); i += maxCores) {{
        //         result = result && ({expression});
        //     }}
        //     break;"##,
        //                             place = (i + 1),
        //                             var_count = eof,
        //                             expression = expr
        //                         );
        // Rust Expression
        out += &format!(
            r##"
// Expression #{place}, Amount of variables: {var_count}
({var_count}, box |s: &S| {{ {expression} }} ),"##,
            place = (i + 1),
            var_count = eof,
            expression = expr
        );
    }
    println!("{}", out);
}
