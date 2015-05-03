require_relative "../extension_finder"
require "minitest/autorun"

describe "TestExtensionFinder" do
  it "returns the extension for the language" do
    extension_finder = ExtensionFinder.new("ruby")
    assert_equal(extension_finder.call, "rb")
  end

  it "raises error if the extension cannot be found" do
    extension_finder = ExtensionFinder.new("durf")
    assert_raises ExtensionFinder::MissingExtension do
      extension_finder.call
    end
  end
end
