require "roda"
require_relative "app/extension_finder"
require_relative "app/fizz_buzz_generator"

class App < Roda
  LANGUAGES = [
    "ruby",
    "rust",
    "javascript"
  ]

  route do |r|
    r.root do
      FizzBuzzGenerator.new.call.join("\n")
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
