require "order"

RSpec.describe "@Order" do
  #Testing for errors
  it "fails if not a string" do
    order = Order.new
    expect { order.add(1) }.to raise_error(ArgumentError, "Not a string.")
  end

  it "fails if no dish added" do
    order = Order.new
    expect { order.add("") }.to raise_error(ArgumentError, "Please include a dish, cannot be empty.")
  end

  it "adds multiple items to the order" do
    order = Order.new
    order.add("Pizza Margherita")
    order.add("Fish and Chips")
    order.add("Fish and Chips")
    expected_order = [
      { name: "Pizza Margherita", price: 8.99, quantity: 1},
      { name: "Fish and Chips", price: 12.99, quantity: 2 },
    ]
    expect(order.all).to eq expected_order
  end
end
