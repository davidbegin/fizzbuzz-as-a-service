require_relative "fizz_checker"
require_relative "buzz_checker"

class FizzBuzzChecker
  def initialize(number)
    @number = number
  end

  def call
    FizzChecker.new(number).call &&
      BuzzChecker.new(number).call
  end

  private

  attr_reader :number
end
