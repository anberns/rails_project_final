# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

teams = Team.create([{ name: "Dolphins", hq: "Brooklyn"}, { name: "Sharks", hq: "Queens"}, { name: "Sailfish", hq: "Manhattan"}])
swimmers = Swimmer.create([{ name: "Diane Houston", email: "dh@gmail.com", password: "password", team_id: "1"},
  { name: "Billy Bob", email: "bb@gmail.com", password: "password", team_id: "1"},
  { name: "Bobby Sue", email: "bs@gmail.com", password: "password", team_id: "2"},
  { name: "James Dean", email: "jd@gmail.com", password: "password", team_id: "2"},
  { name: "Walter Payton", email: "wp@gmail.com", password: "password", team_id: "3"},
])