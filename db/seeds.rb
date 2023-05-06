# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])

puts "start seeds"
Like.destroy_all
Tweet.destroy_all
User.destroy_all





ActiveRecord::Base.connection.reset_pk_sequence!('users')
ActiveRecord::Base.connection.reset_pk_sequence!('tweets')
ActiveRecord::Base.connection.reset_pk_sequence!('likes')
#   Character.create(name: "Luke", movie: movies.first)
puts "user create"
admin = User.create(email: "admin@mail.com", username: "adminAdmin",name:"admin", password: "qwerty",password_confirmation:"qwerty", role: 1)
user1 = User.create(email: "user1@mail.com", username: "userName1",name:"name1", password: "qwerty")
user2 = User.create(email: "user2@mail.com", username: "userName2",name:"name2", password: "qwerty")
user3 = User.create(email: "user3@mail.com", username: "userName3",name:"name3", password: "qwerty")
user4 = User.create(email: "user4@mail.com", username: "userName4",name:"name4", password: "qwerty")
puts admin.errors.full_messages

puts "user created"
puts "tweet create"

tweet = Tweet.create(body:" this is body", user:user3)
tweet1 = Tweet.create(body:" this is body1", user:user3)
tweet2 = Tweet.create(body:" this is body2", user:user1)
tweet3 = Tweet.create(body:" this is body3", user:user2)
tweet4 = Tweet.create(body:" this is body4", user:user2,replied_to: tweet)
tweet5 = Tweet.create(body:" this is body5", user:user2,replied_to: tweet5)
tweet6 = Tweet.create(body:" this is body6", user:user2,replied_to: tweet5)

puts "tweet created"
puts "like create"

puts tweet.errors.full_messages

like = Like.create(user:user3, tweet:tweet)
like1 = Like.create(user:user2, tweet:tweet)
like2 = Like.create(user:user1, tweet:tweet)
like3 = Like.create(user:user1, tweet:tweet1)
like4 = Like.create(user:user3, tweet:tweet2)

puts "like created"

puts like.errors.full_messages


