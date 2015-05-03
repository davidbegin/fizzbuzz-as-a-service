class FizzChecker
  def initialize(number)
    @number = number
  end

  def call
    number % 3 == 0
  end

  private

  attr_reader :number
end
