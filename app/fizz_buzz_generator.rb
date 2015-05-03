require_relative "fizz_buzz_convertor"

class FizzBuzzGenerator
  def call
    (1..100).map do |number|
      FizzBuzzConvertor.new(number).call
    end
  end
end
