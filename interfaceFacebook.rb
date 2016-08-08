require_relative "facebook.rb"
require 'date'

user1 = FacebookUser.new('herrenschmidtpaul@gmail.com', 'Paul')
user2 = FacebookUser.new('herrenschmidtcharles@gmail.com', 'Charles')

user1.add_friend!(user2)


user1.birthdate = Date.new(1994, 3, 12)
p user1

