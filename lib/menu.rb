class Menu
  def initialize
  @menu_items = [
    { name: "Pizza Margherita", price: 8.99 },
    { name: "Spaghetti Bolognese", price: 10.99 },
    { name: "Caesar Salad", price: 6.99 },
    { name: "Fish and Chips", price: 12.99 }
  ]
end

  def dishes #used to access the Menu Items
    @menu_items
  end

  def display #used to display the menu items 
    @menu_items.each do |item|
      puts "#{item[:name]} - $#{item[:price]}"
    end
  end
  
end
