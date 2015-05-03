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
curl http://localhost:1987/fizz
curl http://localhost:1987/buzz

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
