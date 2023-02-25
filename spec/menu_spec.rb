require "menu"

RSpec.describe "@Menu" do
  it "returns items in the menu" do
    menu = Menu.new
    result = [
      { name: "Pizza Margherita", price: 8.99 },
      { name: "Spaghetti Bolognese", price: 10.99 },
      { name: "Caesar Salad", price: 6.99 },
      { name: "Fish and Chips", price: 12.99 }
    ]
    expect(menu.display).to eq result
  end
end