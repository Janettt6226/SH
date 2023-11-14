# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
# Game.destroy_all
Stack.destroy_all

puts " ==================== CREATING USERS ===================="
users = []
paul = User.create!(
  id: 1,
  username: 'Paul',
  password: "password",
  email: "paul@gmail.com"
)
puts paul.username
users << paul.username

doud = User.create!(
  id: 2,
  username: 'Doud',
  password: "password",
  email: "doud@gmail.com"
)
puts doud.username
users << doud.username


raph = User.create!(
  id: 3,
  username: 'Raph',
  password: "password",
  email: "raph@gmail.com"
)
puts raph.username
users << raph.username


paulaire = User.create!(
  id: 4,
  username: 'Paulaire',
  password: "password",
  email: "paulaire@gmail.com"
)
puts paulaire.username
users << paulaire.username

adri = User.create!(
  id: 5,
  username: 'Adri',
  password: "password",
  email: "adri@gmail.com"
)
puts adri.username
users << adri.username

bev = User.create!(
  id: 6,
  username: 'Bev',
  password: "password",
  email: "bev@gmail.com"
)
puts bev.username
users << bev.username


lolo = User.create!(
  id: 7,
  username: 'Lolo',
  password: "password",
  email: "lolo@gmail.com"
)
puts lolo.username
users << lolo.username


nono = User.create!(
  id: 8,
  username: 'Nono',
  password: "password",
  email: "nono@gmail.com"
)
puts nono.username
users << nono.username

puts " ==================== CREATING GAMES ===================="

games = []
10.times do
  game = Game.create!
  games << game.id
end

puts " ==================== CREATING PLAYERS ===================="


player1 = Player.create!(
  user_id: 1,
  game_id: games.first
  )

player2 = Player.create!(
  user_id: 2,
  game_id: games.first
  )

player3 = Player.create!(
  user_id: 3,
  game_id: games.first
  )

puts " ==================== CREATING STACK ===================="

11.times do
  Stack.create!(
    law: "Fascist",
    game_id: games.first
  )
end

6.times do
  Stack.create!(
    law: "Liberal",
    game_id: games.first
  )
end
