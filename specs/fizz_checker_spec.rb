require_relative "../app/fizz_checker"
require "minitest/autorun"

describe FizzChecker do
  it "returns true if it should be converted to Fizz" do
    assert_equal FizzChecker.new(9).call, true
  end

  it "returns false if it should NOT be converted to Fizz" do
    assert_equal FizzChecker.new(10).call, false
  end
end
