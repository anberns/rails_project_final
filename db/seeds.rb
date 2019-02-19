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

events = Event.create([{ name: "50 freestyle", distance: "50", stroke: "freestyle"},
  { name: "100 freestyle", distance: "100", stroke: "freestyle"},
  { name: "100 freestyle", distance: "200", stroke: "freestyle"},
  { name: "100 freestyle", distance: "500", stroke: "freestyle"},
  { name: "100 freestyle", distance: "1000", stroke: "freestyle"},
  { name: "50 backstroke", distance: "50", stroke: "backstroke"},
  { name: "100 backstroke", distance: "100", stroke: "backstroke"},
  { name: "200 backstroke", distance: "200", stroke: "backstroke"},
  { name: "500 backstroke", distance: "500", stroke: "backstroke"},
  { name: "1000 backstroke", distance: "1000", stroke: "backstroke"},
  { name: "50 breaststroke", distance: "50", stroke: "breaststroke"},
  { name: "100 breaststroke", distance: "100", stroke: "breaststroke"},
  { name: "200 breaststroke", distance: "200", stroke: "breaststroke"},
  { name: "500 breaststroke", distance: "500", stroke: "breaststroke"},
  { name: "1000 breaststroke", distance: "1000", stroke: "breaststroke"}
  
])