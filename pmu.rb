#Entrer les noms des 5 chevaux
#Lancer la course au hasard

def back_in_the_race(horses)
  horses.shuffle.each_with_index do |horse, index|
  puts "#{index+1} - #{horse}"
  end
end

horses = ["A", "B", "C", "D"]
puts "Liste des chevaux"

horses.each do |horse|
  puts horse
end

puts "press enter pour lancer la course"

lancement = gets.chomp
puts " "

puts "the race starts"

#shuffle
#display horses with their rank
#
# horses.shuffle.each_with_index do |horse, index|
#   puts "#{index+1} - #{horse}"
# end


back_in_the_race
