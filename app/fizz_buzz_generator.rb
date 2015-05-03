require_relative "fizz_checker"
require_relative "buzz_checker"
require_relative "fizz_buzz_checker"

class FizzBuzzGenerator
  def call
    (1..100).map do |number|
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
  end
end
