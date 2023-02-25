require "order"

RSpec.describe Order do
  describe "#Select" do
    context "when a valid dish is selected" do
      it "adds the dish to the order with a quantity of 1" do
        fake_menu = double(:fake_menu, dishes: [])
        fake_menu_items = [
          { name: "Pizza", price: 12 },
          { name: "Spaghetti", price: 10 },
          { name: "Caesar Salad", price: 8 },
          { name: "Fish and Chips", price: 15 }
        ]
        allow(fake_menu).to receive(:dishes).and_return(fake_menu_items)
        order = Order.new(fake_menu)
        order.select("Pizza")
        expect(order.all).to eq([{ name: "Pizza", price: 12, quantity: 1 }])
      end

      it "adds multiple dishes to the order with increased quantities" do

        fake_menu = double(:fake_menu, dishes: [])
        fake_menu_items = [
          { name: "Pizza", price: 12 },
          { name: "Spaghetti", price: 10 },
          { name: "Caesar Salad", price: 8 },
          { name: "Fish and Chips", price: 15 }
        ]
        allow(fake_menu).to receive(:dishes).and_return(fake_menu_items)
        order = Order.new(fake_menu)
        order.select("Pizza")
        order.select("Pizza")
        order.select("Spaghetti")
        expect(order.all).to eq([{ name: "Pizza", price: 12, quantity: 2 }, { name: "Spaghetti", price: 10, quantity: 1 }])
      end
    end

    context "when an invalid dish is selected" do
      it "does not add dish to the order" do
        fake_menu = double(:fake_menu, dishes: [])
        fake_menu_items = [
          { name: "Pizza", price: 12 },
          { name: "Spaghetti", price: 10 },
          { name: "Caesar Salad", price: 8 },
          { name: "Fish and Chips", price: 15 }
        ]
        allow(fake_menu).to receive(:dishes).and_return(fake_menu_items)
        order = Order.new(fake_menu)
        expect(order.select("invalid dish")).to be_nil
      end
    end

    context "When an empty dish name is selected" do
      it "returns argument error" do
        fake_menu = double(:fake_menu, dishes: [])
        fake_menu_items = [
          { name: "Pizza", price: 12 },
          { name: "Spaghetti", price: 10 },
          { name: "Caesar Salad", price: 8 },
          { name: "Fish and Chips", price: 15 }
        ]
        allow(fake_menu).to receive(:dishes).and_return(fake_menu_items)
        order = Order.new(fake_menu)
        expect{ order.select("") }.to raise_error(ArgumentError, "Please include a dish, cannot be empty.")   
      end
    end

    context "When the dish input is not a string" do
      it "Returns argument error" do
        fake_menu = double(:fake_menu, dishes: [])
        fake_menu_items = [
          { name: "Pizza", price: 12 },
          { name: "Spaghetti", price: 10 },
          { name: "Caesar Salad", price: 8 },
          { name: "Fish and Chips", price: 15 }
        ]
        allow(fake_menu).to receive(:dishes).and_return(fake_menu_items)
        order = Order.new(fake_menu)
        expect{ order.select(1) }.to raise_error(ArgumentError, "Not a string.")   
      end
    end
  end
end
