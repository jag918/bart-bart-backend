class CreateAnimals < ActiveRecord::Migration[5.2]
  def change
    create_table :animals do |t|
      t.string :name
      t.string :breed
      t.string :description
      t.string :image
      t.integer :owner_id

      t.timestamps
    end
  end
end
