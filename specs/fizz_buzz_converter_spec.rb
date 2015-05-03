require "minitest/autorun"
require_relative "../app/fizz_buzz_convertor"

describe FizzBuzzConvertor do
  it "returns the result for a single number" do
    assert_equal FizzBuzzConvertor.new(9).call, "Fizz"
    assert_equal FizzBuzzConvertor.new(10).call, "Buzz"
    assert_equal FizzBuzzConvertor.new(30).call, "FizzBuzz"
    assert_equal FizzBuzzConvertor.new(29).call, 29
  end
end
