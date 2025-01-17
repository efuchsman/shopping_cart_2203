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
    @products.sum(&:quantity)
  end

  def is_full?
    total_number_products > @capacity
  end

  def products_by_category(category)
    @products.select do |product|
      product.category == category
    end
  end

  def percentage_occupied
    ((total_number_products.to_f / capacity.to_f) * 100).round(2)
  end

  def sort_products_by_quantity
    sorted = @products.sort_by(&:quantity)
    sorted.reverse
  end

  def product_breakdown
    breakdown = Hash.new{|h, k| h[k] = []}
    @products.each do |product|
      breakdown[product.category] << product
    end
    p breakdown
  end

end
