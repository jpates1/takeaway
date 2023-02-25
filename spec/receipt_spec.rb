require "receipt"

#need to mock the order functionality

RSpec.describe @Receipt do
  describe "#total_cash" do
    context "Running the sum of the order" do
      it "sums the total from the order" do
        fake_order = double(:fake_order, all: [])
        fake_order_items = [
          { name: "Pizza", price: 12.99, quantity: 2 },
          { name: "Spaghetti", price: 10.99, quantity: 1 },
        ]
        allow(fake_order).to receive(:all).and_return(fake_order_items)
        receipt = Receipt.new(fake_order)
        expect(receipt.total_cash).to eq "£36.97"
      end
    end
  end

  describe "#total_qty" do
    context "Running the quantity of the items in the order" do
      it "sums the total quantity from the order" do
        fake_order = double(:fake_order, all: [])
        fake_order_items = [
          { name: "Pizza", price: 12.99, quantity: 2 },
          { name: "Spaghetti", price: 10.99, quantity: 1 },
        ]
        allow(fake_order).to receive(:all).and_return(fake_order_items)
        receipt = Receipt.new(fake_order)
        expect(receipt.total_qty).to eq "3"
      end
    end
  end

  describe "#run_receipt" do
    context "Returns an itemised receipt" do
      it "" do
        fake_order = double(:fake_order, all: [])
        fake_order_items = [
          { name: "Pizza", price: 12.99, quantity: 2 },
          { name: "Spaghetti", price: 10.99, quantity: 1 },
        ]
        allow(fake_order).to receive(:all).and_return(fake_order_items)
        receipt = Receipt.new(fake_order)

        itemised_receipt = "Thank you for your order.\n------------------------\nYou have ordered 3 items:\nPizza, Qty 2, £12.99\nSpaghetti, Qty 1, £10.99\n------------------------\nTotal: £36.97\n------------------------\nYou will shortly receive a text confirmation."

        expect(receipt.print_receipt).to eq itemised_receipt
      end
    end
  end
end