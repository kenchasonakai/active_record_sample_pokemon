require "active_record"

# データベースへの接続
ActiveRecord::Base.establish_connection(
  adapter:   'sqlite3',
  database:  'db/development.sqlite3'
)

# スキーマの設定
class InitialSchema < ActiveRecord::Migration[5.1]
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :birthplace
    end
  end

  def self.down
    drop_table :users
  end
end

class CreatePokemon < ActiveRecord::Migration[5.1]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.references :type
    end
  end
end

class CreateUserPokemon < ActiveRecord::Migration[5.1]
  def change
    create_table :user_pokemons do |t|
      t.references :user
      t.references :pokemon
    end
  end
end

class CreateType < ActiveRecord::Migration[5.1]
  def change
    create_table :types do |t|
      t.string :name
    end
  end
end

class CreatePokemonType < ActiveRecord::Migration[5.1]
  def change
    create_table :pokemon_types do |t|
      t.references :type
      t.references :pokemon
    end
  end
end

InitialSchema.migrate(:up)
CreatePokemon.migrate(:change)
CreateUserPokemon.migrate(:change)
CreateType.migrate(:change)
CreatePokemonType.migrate(:change)