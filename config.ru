require "roda"

class App < Roda
  route do |r|
    r.root do
      "\n\nWe offer multiple custom Fizzbuzz solutions\n\n"
    end

    LANGUAGES = [
      "ruby"
    ]

    LANGUAGES.each do |lang|
      r.on lang do
        File.read("solutions/#{lang}.#{ExtensionFinder.new(lang).call}")
      end
    end
  end
end

class ExtensionFinder
  def initialize(lang)
    @lang = lang
  end

  def call
    case lang
    when "ruby" then "rb"
    end
  end

  private

  attr_reader :lang
end

run App.app
