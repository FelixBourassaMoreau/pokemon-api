# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'pokemons.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Pokemon.new
  t.number = row['number']
  t.name = row['name']
  t.type1 = row['type1']
  t.type2 = row['type2']
  t.total = row['total']
  t.hp = row['hp']
  t.attack = row['attack']
  t.defense = row['defense']
  t.sp_atk = row['sp_atk']
  t.sp_def = row['sp_def']
  t.speed = row['speed']
  t.generation = row['generation']
  t.legendary = row['legendary']
  t.save
end