class Items

  @@inventory = [
    { product: "milk", price: 1.29 },
    { product: "bread", price: 0.89 },
    { product: "ham", price: 1.59 },
    { product: "brownie", price: 3.79 },
    { product: "macrel", price: 4.59 }
  ]
def see_price(product_name)
  puts product_choice(product_name)[:price]
  end
  def product_choice(product_name)
    selection =  @@inventory.select { |hash| hash.value?(product_name)}
    (raise StandardError.new "item not in stock") if selection.empty?
    selection[0]
  end
end

class Checkout

  def initialize
    @stock = Items.new
    @basket = []
  end

  def scan_item(item)
    @basket << @stock.product_choice(item)
  end

  def total
    puts "Items:"
    @basket.each { |hash| puts "#{hash[:product]}: £#{hash[:price]}"}
    to_sum = @basket.map { |hash| hash[:price] }
    puts "total: £#{to_sum.inject(0, :+)}"
  end
end

 
