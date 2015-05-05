#![feature(convert)]

extern crate hyper;
extern crate type_printer;

use std::io::Read;

use hyper::Client;
use hyper::header::Connection;
use hyper::header::ConnectionOption;

fn main() {
    for num in 1..100000 {
        fizz_or_buzz_or_fizzbuzz_or_else(num);
    }
}

fn fizz_or_buzz_or_fizzbuzz_or_else(num: i32) {
    let mut client = Client::new();

    let heap_url = format!("http://localhost:1987/fizzbuzz/{}", num);
    let stack_url: &str = heap_url.as_str();

    let mut res = client.get(stack_url)
        .header(Connection(vec![ConnectionOption::Close]))
        .send().unwrap();

    let mut body = String::new();
    res.read_to_string(&mut body).unwrap();
    println!("{}", body);
}
