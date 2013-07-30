require 'test/unit'
require_relative '../item.tab'
require_relative '../domain'

class TestFirst < Test::Unit::TestCase
  def testReadTwo
    parser = ItemParser.new
    parser.parse "item camera\nitem laser\n"
    assert_equal 2, parser.result.size
    assert_equal 'camera', parser.result[0].name
    assert_equal 'laser', parser.result[1].name
  end

  def testReadBad
    parser = ItemParser.new
    parser.parse "xitem camera"
    fail
  rescue #expected
  end   
end