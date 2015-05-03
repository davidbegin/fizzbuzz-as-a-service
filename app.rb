require "roda"
require "json"
require_relative "app/fizz_buzz_generator"
require_relative "app/fizz_buzz_convertor"

class App < Roda

  class << self
    def languages
      language_config.keys
    end

    def language_config
      @language_config ||= JSON.parse(File.read("config/languages.json"))
    end
  end

  LANGUAGES = [
    "ruby",
    "rust",
    "javascript"
  ]

  route do |r|
    r.root do
      FizzBuzzGenerator.new.call.join("\n")
    end

    r.get "fizzbuzz" do
      number = CGI.parse(env["QUERY_STRING"]).fetch("num").first.to_i
      FizzBuzzConvertor.new(number).call.to_s
    end

    r.on "fizz" do
      number = CGI.parse(env["QUERY_STRING"]).fetch("num").first.to_i
      FizzChecker.new(number).call.to_s
    end

    r.on "buzz" do
      number = CGI.parse(env["QUERY_STRING"]).fetch("num").first.to_i
      BuzzChecker.new(number).call.to_s
    end

    self.class.languages.each do |lang|
      r.on lang do
        File.read("solutions/#{lang}.#{self.class.language_config.fetch(lang)}")
      end
    end
  end
end
