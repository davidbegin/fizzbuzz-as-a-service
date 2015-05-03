class BuzzChecker
  def initialize(number)
    @number = number
  end

  def call
    number % 5 == 0
  end

  private

  attr_reader :number
end
