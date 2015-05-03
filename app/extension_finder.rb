class ExtensionFinder
  class MissingExtension < StandardError; end

  def initialize(language)
    @language = language
  end

  def call
    case language
    when "ruby" then "rb"
    when "rust" then "rs"
    when "javascript" then "js"
    else
      raise MissingExtension
    end
  end

  private

  attr_reader :language
end
