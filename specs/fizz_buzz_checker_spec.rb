require "minitest/autorun"
require_relative "../app/fizz_buzz_checker"

describe FizzBuzzChecker do
  it "returns true if the number should be converted to FizzBuzz" do
    assert_equal FizzBuzzChecker.new(30).call, true
  end

  it "returns false if the number should be converted to FizzBuzz" do
    assert_equal FizzBuzzChecker.new(29).call, false
  end
end
