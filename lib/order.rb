require_relative "menu"
class Order
  def initialize
    @menu_items = Menu.dishes
    @order = []
  end

  def add(dish)
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
