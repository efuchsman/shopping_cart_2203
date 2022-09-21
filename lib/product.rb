class Product

  attr_reader :category, :name, :unit_price, :quantity, :total_price, :hoarded

  def initialize(category, name, unit_price, quantity)
    @category = category
    @name = name
    @unit_price = unit_price
    @quantity = quantity.to_i
    @total_price = @unit_price * @quantity
    @hoarded = false
  end

  def hoarded?
    @hoarded
  end

  def hoard
  @hoarded = true
  end



end
