class CreateUserPokemon < ActiveRecord::Migration[5.1]
  def change
    create_table :user_pokemons do |t|
      t.references :user
      t.references :pokemon

      t.timestamps
    end
  end
end