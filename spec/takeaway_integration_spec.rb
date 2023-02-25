require "menu"
require "order"
require "text_send"
require "receipt"

RSpec.describe "integration" do
  describe "Menu : Order Integration" do
    context "Adding an item from menu to order functionality" do
      it "Adds multiple items to the order from menu and counts the quanitiy" do
        menu = Menu.new
        order = Order.new(menu)
        order.select("Pizza Margherita")
        order.select("Fish and Chips")
        order.select("Fish and Chips")
        expected_order = [
          { name: "Pizza Margherita", price: 8.99, quantity: 1},
          { name: "Fish and Chips", price: 12.99, quantity: 2 }
        ]
        expect(order.all).to eq expected_order
      end
    end
  end

  describe "Order : Receipt Integration" do
    context "When the order is complete, receipt is run" do
      it "Sums the total of the order" do
        menu = Menu.new
        order = Order.new(menu)
        receipt = Receipt.new(order)
        order.select("Pizza Margherita")
        order.select("Fish and Chips")
        order.select("Fish and Chips")
        expect(receipt.print_receipt).to eq "Thank you for your order.\n------------------------\nYou have ordered 3 items:\nPizza Margherita, Qty 1, £8.99\nFish and Chips, Qty 2, £12.99\n------------------------\nTotal: £34.97\n------------------------\nYou will shortly receive a text confirmation."
      end
    end
  end
end