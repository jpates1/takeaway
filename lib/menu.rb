class Menu
  MENU_ITEMS = [
    { name: "Pizza Margherita", price: 8.99 },
    { name: "Spaghetti Bolognese", price: 10.99 },
    { name: "Caesar Salad", price: 6.99 },
    { name: "Fish and Chips", price: 12.99 }
  ]

  def dishes #used to access the Menu Items
    MENU_ITEMS
  end

  def display #used to display the menu items 
    MENU_ITEMS.each do |item|
      puts "#{item[:name]} - $#{item[:price]}"
    end
  end
end
