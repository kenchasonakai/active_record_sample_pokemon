require "active_record"

# データベースへの接続
ActiveRecord::Base.establish_connection(
  adapter:   'sqlite3',
  database:  'db/development.sqlite3'
)

class User < ActiveRecord::Base
  has_many :user_pokemons
  has_many :pokemons, through: :user_pokemons
end

class Pokemon < ActiveRecord::Base
  has_many :user_pokemons
  belongs_to :user, through: :user_pokemons
  has_many :pokemon_types
  has_many :types, through: :pokemon_types
end

class UserPokemon < ActiveRecord::Base
  belongs_to :user
  belongs_to :pokemon
end

class Type < ActiveRecord::Base
end

class PokemonType < ActiveRecord::Base
  belongs_to :type
  belongs_to :pokemon
end