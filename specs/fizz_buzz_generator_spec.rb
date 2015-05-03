require "minitest/autorun"
require_relative "../app/fizz_buzz_generator"

describe FizzBuzzGenerator do
  it "generates fizz buzz" do
    FizzBuzzGenerator.new.call
  end
end
