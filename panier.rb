#creer un panier ou l'on peut insérer tout ce que l'on veut
#lister les élements
#quantifier le nombre d'item avec le prix + total facture

stock = {
  bananas: {
    quantity: 10,
    price: 5
  },
  fraise: {
    quantity: 9,
    price: 4
  },
  pomme: {
    quantity: 8
    price: 3
  }
}
cart = {}
answer = nil


until answer == "no" #condition d'arrêt
  puts "Add a fruit?"
  fruit = gets.chomp
  puts "what is the quantity ?"
  number = gets.chomp.to_i
  if number <= stock[fruit.to_sym][:quantity]
    cart[fruit] = {
      quantity: number,
      price: stock[fruit.to_sym][:price]
    }
  puts "what is the price ?"
  unit_price = gets.chomp.to_i


  cart[fruit] = {
    quantity: number,
    price: unit_price
  }

# fruit est la clé. quantity et price sont des symboles.
# fruit => quantité / price

  puts "Do you want to continue shopping ?"
  answer = gets.chomp
end



#diplay the cart

# puts "there is #{cart} in my cart"
puts "-" * 30
puts "shopping cart"
total_price = 0

cart.each do |fruit, properties|
  subtotal = properties[:quantity] * properties[:price]
  puts "- #{properties[:quantity]} kg of #{fruit}: #{subtotal}€"
end

# gestion des stocks


