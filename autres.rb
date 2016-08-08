wishlist = [
  {name: "socks", price: 5, checked: true},
  {name: "tie", price: 15, checked: false}
]

answer = nil
until answer == 5
  puts "What do you want to do :"
  puts "1 - List wishlist"
  puts "2 - Add item"
  puts "3 - Remove item"
  puts "4 - Mark item as bought"
  puts "5 - Exit"
  puts "Choose your number"
  answer = gets.chomp.to_i

case answer
  when 1
    puts "the wishlist is #{wishlist}"
  when 2
    puts "Add an new item"
    answer = gets.chomp
    wishlist << answer
  when 3
    puts "Which item do you want to remove ?"
    wishlist.each_with_index do |item, index|
      if item[:checked]
        puts "#{index + 1} - [X] #{item[:name]} #{item[:price]}€"
      else
        puts "#{index + 1} - [] #{item[:name]} #{item[:price]}€"
      end
    end
    item_index = gets.chomp.to_i - 1
    wishlist.delete_at(item_index)
  else
    answer = 5
end
end



#ADD AN ITEM

# puts "Which item do you want add "




  # end


#   puts "Which item do you want add ?"
#   name = gets.chomp
#   puts "what is the price ?"
#   price = gets.chomp.to_i

# new_item =
#   {
#     name: name,
#     price: price,
#     checked: false
#   },

# wishlist << new_item

# puts "Do you want to continue, press enter ?"
# answer = gets.chomp


# # def remplir_wishlist(item)
# # item.each |element|
#   # puts element
# # return wishlist << item
# # end

# puts wishlist

# puts "What do you want to do ?"
# answer = gets.chomp.to_i
