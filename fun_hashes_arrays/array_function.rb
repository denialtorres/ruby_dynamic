class Whishlist
  attr_reader :items

  def initialize
    @items = []
  end

  def add(*items)
    @items.concat(items.map{|input| Array(input)}.flatten)
  end
end

list = Whishlist.new
list.add("Rancillo Silvia Espresso", "Cheese")
list.add("CAR", "BOAT")
list.add(nil)
list.add(["FANY", "BOOTS"])
list.add("one word")
