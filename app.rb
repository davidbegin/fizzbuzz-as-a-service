require "roda"
require_relative "app/extension_finder"

class App < Roda
  LANGUAGES = [
    "ruby"
  ]

  route do |r|
    r.root do
      "\n\nWe offer multiple custom Fizzbuzz solutions\n\n"
    end

    r.on "fizz" do
      "Fizz"
    end

    r.on "buzz" do
      "Buzz"
    end

    r.on "fizzbuzz" do
      "FizzBuzz"
    end

    LANGUAGES.each do |lang|
      r.on lang do
        File.read("solutions/#{lang}.#{ExtensionFinder.new(lang).call}")
      end
    end
  end
end
