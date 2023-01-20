class CreatePokemonType < ActiveRecord::Migration[5.1]
  def change
    create_table :pokemon_types do |t|
      t.references :type
      t.references :pokemon

      t.timestamps
    end
  end
end