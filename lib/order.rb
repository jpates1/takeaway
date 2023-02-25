class Order
  def initialize(menu)
    @menu_items = menu.dishes
    @order = []
  end

  def select(dish)
    raise  ArgumentError, "Not a string." unless dish.is_a?(String)
    raise  ArgumentError, "Please include a dish, cannot be empty." if dish.empty?

    item = @menu_items.find { |item| item[:name] == dish }
      if item
        existing_item = @order.find { |item| item[:name] == dish }
        if existing_item
          existing_item[:quantity] += 1
        else
          @order << item.merge(quantity: 1)
        end
      end
  end

  #future add option to remove the dish from the order. 

  def all
    @order
  end

end

# menu = Menu.new
# order = Order.new
# order.select("Fish and Chips")
# p order.all