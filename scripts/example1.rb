require "net/http"
require "uri"

(1..100).each do |number|
  uri = URI.parse("http://localhost:1987/fizzbuzz?num=#{number}")
  puts Net::HTTP.get_response(uri).body
end
