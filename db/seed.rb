require './models.rb'
require 'csv'
csv_file = CSV.read("./csvs/poke.csv")

csv_file.each do |row|
  pokemon_name, *types = row
  pokemon = Pokemon.create(name: pokemon_name)
  pokemon.types << types.map { |type_name| Type.find_or_create_by(name: type_name) }
  puts "name: #{pokemon.name} type: #{pokemon.types.pluck(:name)}"
end

# ポケモントレーナーといえばサトシ
user = User.create(name: 'サトシ', birthplace: 'マサラタウン')

# 適当に調べて出て来たサトシの手持ちポケモン
satosi_pokemons = %w[ピカチュウ カイリュー ゲンガー ルカリオ ネギガナイト ウオノラゴン]

user.pokemons << satosi_pokemons.map { |name| Pokemon.find_by(name: name) }