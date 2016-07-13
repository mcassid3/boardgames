# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
# Game.create!(title: "Settlers of Catan", description: "A really cool strategy game that causes you to lose friends when the games get intense", duration: "60 minutes", player_count: 4)

require 'bgg-api'

bgg = BggApi.new

#grab ids from top 50
response = bgg.hot( {:type => 'boardgame'} )
new_response = response.to_json
parsed = JSON.parse(new_response)
ids = []
parsed["item"].each do |item|
   ids << item["id"].to_i
 end

ids.each do |id|
  game = bgg.thing(id: id)

  parsed_game = JSON.parse(game.to_json)
  item = parsed_game["item"]

  title = item[0]["name"][0]["value"]
  description = item[0]["description"][0]
  photo = item[0]["image"][0]
  max_players = item[0]["maxplayers"][0]["value"]
  min_playing_time = item[0]["minplaytime"][0]["value"]

 Game.create!(title: title, description: description, max_players: max_players, min_playing_time: min_playing_time, photo: photo)

  sleep 1
 end

