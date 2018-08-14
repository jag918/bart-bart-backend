class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.integer :seeker_id
      t.integer :animal_favorite_id
      t.timestamps
    end
  end
end
