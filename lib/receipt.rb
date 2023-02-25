class Receipt
  def initialize(order)
    @order = order
  end

  def total_qty
    sum_qty
  end

  def total_cash
    sum_total
  end

  def print_receipt
    "Thank you for your order.\n" +
    "------------------------\n" +
    "You have ordered #{total_qty} items:\n" +
    "#{format_items}" +
    "------------------------\n" +
    "Total: #{total_cash}\n" +
    "------------------------\n" +
    "You will shortly receive a text confirmation."
  end

  private

  def sum_total
    total = 0
    @order.all.each do |order_line|
      total += order_line[:price] * order_line[:quantity]
    end
    "£#{total}"
  end


  def sum_qty
    qty = 0
    @order.all.each do |order_line|
      qty += order_line[:quantity]
    end
    qty.to_s
  end
  
  def format_items
    str = ""
    @order.all.each do |order_line|
      str += "#{order_line[:name]}, Qty #{order_line[:quantity]}, £#{order_line[:price]}\n"
    end
    str
  end
end
