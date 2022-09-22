require 'rspec'
require './lib/product'
require './lib/shopping_cart'

RSpec.describe ShoppingCart do
  it "exists and has readable attributes" do
    cart = ShoppingCart.new("King Soopers", "30items")

    expect(cart).to be_an_instance_of(ShoppingCart)
    expect(cart.name).to eq("King Soopers")
    expect(cart.capacity).to eq(30)
  end

  it 'can have products' do
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')

    cart.add_product(product1)
    cart.add_product(product2)

    expect(cart.products).to eq([product1, product2])
    expect(cart.details).to eq({name: "King Soopers", capacity: 30})

  end

  it 'can determine if a cart is full' do
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')

    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)

    expect(cart.total_number_products).to eq(13)

    product4 = Product.new(:produce, 'apples', 0.99, '20')
    cart.add_product(product4)

    expect(cart.is_full?).to be true
    expect(cart.products_by_category(:paper)).to eq([product1, product3 ])
  end

    it "can finish the rest of iteration 4" do
      cart = ShoppingCart.new("King Soopers", "30items")
      product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
      product2 = Product.new(:meat, 'chicken', 4.50, '2')
      product3 = Product.new(:paper, 'tissue paper', 1.25, '1')

      cart.add_product(product1)
      cart.add_product(product2)
      cart.add_product(product3)

      expect(cart.percentage_occupied).to eq(43.33)

      product4 = Product.new(:produce, 'apples', 0.99, '20')
      cart.add_product(product4)

      expect(cart.sort_products_by_quantity).to eq([product4, product1, product2, product3])

      expect(cart.product_breakdown).to eq(
        {
          :meat => [product2],
          :paper => [product1, product3],
          :produce => [product4]
      }
    )
  end

end
