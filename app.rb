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

    LANGUAGES.each do |lang|
      r.on lang do
        File.read("solutions/#{lang}.#{ExtensionFinder.new(lang).call}")
      end
    end
  end
end

