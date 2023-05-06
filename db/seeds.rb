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
tanus = User.create(email: "tanus@mail.com", username: "tanus",name:"The Great Tanus", password: "qwerty")
goku = User.create(email: "goku2023@mail.com", username: "goku2023",name:"Son Goku", password: "qwerty")
diego = User.create(email: "diego@mail.com", username: "diego",name:"Diego Torres", password: "qwerty")
neil = User.create(email: "drRealNeil@mail.com", username: "drRealNeil",name:"The Real Neil", password: "qwerty")
daniel = User.create(email: "daniel@mail.com", username: "danielMH",name:"Daniel Martínez", password: "123456", role: 1)
puts daniel.errors.full_messages

puts "user created"
puts "attached create"
tanus.avatar.attach(io: File.open("./app/assets/images/tanus.png"),filename: "tanus.png")
puts tanus.errors.full_messages
goku.avatar.attach(io: File.open("./app/assets/images/goku.png"),filename: "goku.png")
puts goku.errors.full_messages
diego.avatar.attach(io: File.open("./app/assets/images/diegoTorres.png"),filename: "diegoTorres.png")
puts diego.errors.full_messages
neil.avatar.attach(io: File.open("./app/assets/images/realNeil.png"),filename: "realNeil.png")
puts neil.errors.full_messages
daniel.avatar.attach(io: File.open("./app/assets/images/daniel.png"),filename: "daniel.png")
puts daniel.errors.full_messages
puts "attached created"

puts "tweet create"

tweet = Tweet.create(body:" This universe is finite, its resources, finite… if life is left unchecked, life will cease to exist.", 
                     user:tanus)
tweet1 = Tweet.create(body:"Even a low class warrior can surpass an elite. With enough hard work.", 
                      user:goku)
tweet2 = Tweet.create(body:"Everyone share some kind of 'quote', should I as well?", 
                      user:diego)
tweet3 = Tweet.create(body:" For me, I am driven by two main philosophies: know more today about the world than I knew yesterday and lessen the suffering of others.", 
                      user:neil)
tweet4 = Tweet.create(body:"Fleur Delacour, though she demonstrated excellent use of the Bubble-Head Charm, was attacked by grindylows", 
                      user:daniel)
tweet5 = Tweet.create(body:"She put a shaking hand inside the bag and drew out a tiny, perfect model of a dragon - a Welsh Green.", 
                      user:tanus,replied_to: tweet4)
tweet6 = Tweet.create(body:"She put a shaking hand inside the bag and drew out a tiny, perfect model of a dragon - a Welsh Green. ", 
                      user:daniel,replied_to: tweet)

puts "tweet created"
puts "like create"

puts tweet.errors.full_messages

like = Like.create(user:diego, tweet:tweet)
like1 = Like.create(user:daniel, tweet:tweet)
like2 = Like.create(user:daniel, tweet:tweet2)
like3 = Like.create(user:neil, tweet:tweet)
like4 = Like.create(user:tanus, tweet:tweet4)

puts "like created"

puts like.errors.full_messages


