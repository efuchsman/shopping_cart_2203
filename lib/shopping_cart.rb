class ShoppingCart

  attr_reader :name, :capacity, :products

  def initialize(name, capacity)
    @name = name
    @capacity = capacity.chars.first(2).join.to_i
    @products = []
  end

  def add_product(product)
    @products << product
  end

  def details
    cart_hash = {
      :name => @name,
      :capacity => @capacity
    }

  end

  def total_number_products
    @products.sum do |product|
      product.quantity
    end
  end

  def is_full?
    total_number_products > @capacity
  end


end
