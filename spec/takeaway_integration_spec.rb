require "menu"
require "order"
require "text_send"
require "receipt"

RSpec.describe "integration" do 
  it "displays the menu items to the customer during the order proces" do
    menu = Menu.new
    order = Order.new(menu)
    result = "Pizza Margherita - $8.99\nSpaghetti Bolognese - $10.99\nCaesar Salad - $6.99\nFish and Chips - $12.99\n"
    expect(order.show_menu).to eq result
  end
end