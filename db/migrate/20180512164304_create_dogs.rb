class CreateDogs < ActiveRecord::Migration[5.2]
  def change
    create_table :dogs do |t|
      t.string :name
      t.date :birth_date
      t.string :breed 
      t.integer :gender
      t.float :location_lat
      t.float :location_lng
      t.text :description
      t.integer :adopter_id, null => true
      t.integer :publisher_id

      t.timestamps
    end
  end
end
