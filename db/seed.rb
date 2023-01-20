require './models.rb'
user = User.create(name: 'サトシ', birthplace: 'マサラタウン')
type = Type.create(name: '電気')
pokemon = Pokemon.create(name: 'ピカチュウ')
user.pokemons << pokemon
pokemon.types << type