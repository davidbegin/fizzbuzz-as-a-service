require "minitest/autorun"
require_relative "../app/buzz_checker"

describe BuzzChecker do
  it "returns true if the number should be converted to Buzz" do
    assert_equal BuzzChecker.new(25).call, true
  end

  it "returns false if the number should be converted to Buzz" do
    assert_equal BuzzChecker.new(26).call, false
  end
end
