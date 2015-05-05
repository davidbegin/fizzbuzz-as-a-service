#![allow(dead_code)]

pub fn fizzbuzz_converter(num: i32) -> String {
    let divisible_by_3_eh: bool = num % 3 == 0;
    let divisible_by_5_eh: bool = num % 5 == 0;

    if divisible_by_3_eh && divisible_by_5_eh {
        "FizzBuzz".to_string()
    } else if divisible_by_3_eh {
        "Fizz".to_string()
    } else if divisible_by_5_eh {
        "Buzz".to_string()
    } else {
        num.to_string()
    }
}

#[test]
fn nine_is_fizz() {
    assert_eq!(fizzbuzz_converter(9), "Fizz".to_string());
}

#[test]
fn fifteen_is_fizzbuzz() {
    assert_eq!(fizzbuzz_converter(15), "FizzBuzz".to_string());
}

#[test]
fn ten_is_buzz() {
    assert_eq!(fizzbuzz_converter(10), "Buzz".to_string());
}

#[test]
fn eleven_is_eleven() {
    assert_eq!(fizzbuzz_converter(11), "11".to_string());
}
