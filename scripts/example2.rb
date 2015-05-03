require "net/http"
require "uri"

(1..100).each do |number|
  fizz_url = URI.parse("http://localhost:1987/fizz?num=#{number}")
  divisible_by_3 = Net::HTTP.get_response(fizz_url).body

  buzz_url = URI.parse("http://localhost:1987/buzz?num=#{number}")
  divisible_by_5 = Net::HTTP.get_response(buzz_url).body

  output = if divisible_by_3 == "true" && divisible_by_5 == "true"
    "FizzBuzz"
  elsif divisible_by_3 == "true"
    "Fizz"
  elsif divisible_by_5 == "true"
    "Buzz"
  else
    number.to_s
  end

  puts output
end
