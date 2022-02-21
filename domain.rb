require 'forwardable'

class Item
  attr_reader :name

  def initialize name
    @name = name
  end
end

class Catalog
  extend Forwardable

  def initialize
    @items = []
  end

  def_delegators :@items, :size, :<<, :[]
end
