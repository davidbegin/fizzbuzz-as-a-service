FizzBuzz as a Service
---

Finally the solution to all your problems.

```ruby
bundle exec rackup -p 1987
```

Here are the current endpoints our service is providing right now
```bash
curl http://localhost:1987/
curl http://localhost:1987/ruby

# New Feature!
curl http://localhost:1987/fizz?num=9
# => true
curl http://localhost:1987/fizz?num=11
# => false

# New Feature!
curl http://localhost:1987/buzz?num=10
# => true
curl http://localhost:1987/buzz?num=11
# => false

# New Feature!
curl http://localhost:1987/fizzbuzz?num=9
# => "Fizz"
curl http://localhost:1987/fizzbuzz?num=10
# => "Buzz"
curl http://localhost:1987/fizzbuzz?num=30
# => "FizzBuzz"
curl http://localhost:1987/fizzbuzz?num=29
# => "29"
```

With our new API, you can write more scalable FizzBuzz solutions than ever!

```ruby
require "net/http"
require "uri"

(1..100).each do |number|
  uri = URI.parse("http://localhost:1987/fizzbuzz?num=#{number}")
  puts Net::HTTP.get_response(uri).body
end
```

Second example of using lower level API:

```ruby
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
```
