class AddVotesToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.integer :first_place_beer_id
      t.integer :second_place_beer_id
      t.integer :third_place_beer_id
      t.integer :fourth_place_beer_id
      t.integer :fifth_place_beer_id
    end

    add_index :users, :first_place_beer_id
    add_index :users, :second_place_beer_id
    add_index :users, :third_place_beer_id
    add_index :users, :fourth_place_beer_id
    add_index :users, :fifth_place_beer_id
  end
end
