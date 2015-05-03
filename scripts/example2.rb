require "net/http"
require "uri"

(1..100).each do |number|
  fizz_url = URI.parse("http://localhost:1987/fizz?num=#{number}")
  divisible_by_3 = Net::HTTP.get_response(fizz_url).body == "true"

  buzz_url = URI.parse("http://localhost:1987/buzz?num=#{number}")
  divisible_by_5 = Net::HTTP.get_response(buzz_url).body == "true"

  output = if divisible_by_3 && divisible_by_5
    "FizzBuzz"
  elsif divisible_by_3
    "Fizz"
  elsif divisible_by_5
    "Buzz"
  else
    number.to_s
  end

  puts output
end
