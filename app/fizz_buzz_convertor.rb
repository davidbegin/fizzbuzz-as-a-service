require_relative "fizz_checker"
require_relative "buzz_checker"
require_relative "fizz_buzz_checker"

class FizzBuzzConvertor
  def initialize(number)
    @number = number
  end

  def call
    if FizzBuzzChecker.new(number).call
      "FizzBuzz"
    elsif FizzChecker.new(number).call
      "Fizz"
    elsif BuzzChecker.new(number).call
      "Buzz"
    else
      number
    end
  end

  private

  attr_reader :number
end
