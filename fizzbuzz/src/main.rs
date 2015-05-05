#[macro_use] extern crate nickel;

use nickel::Nickel;
use nickel::router::http_router::HttpRouter;
extern crate fizzbuzz;

fn main() {
    let mut server = Nickel::new();

    server.get("/fizzbuzz/:num", middleware! { |request|
        let num_param = request.param("num");
        let num: i32 = num_param.parse().unwrap();
        let result = fizzbuzz::fizzbuzz_converter(num);
        format!("{}", result)
    });

    server.get("/fizz", middleware!("Fizz"));
    server.get("/buzz", middleware!("Buzz"));

    server.utilize(router! {
        get "**" => |_req, _res| {
            "Rust FizzBuzz coming soon!"
        }
    });


    server.listen("127.0.0.1:1987");
}
