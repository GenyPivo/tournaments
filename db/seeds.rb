# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times { |i|
  i = i + 1
  u = User.create!(email: "test_#{i}@test.com", nick: "nick_#{i}", password: '123456')
  Team.create(name: "Team_#{i}", user_id: u.id)
}

10.times { |i| Tournament.create(name: "Tournament_#{i + 1}") }
