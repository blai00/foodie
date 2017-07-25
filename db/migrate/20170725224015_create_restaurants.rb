class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :city
      t.string :state
      t.references :recipe, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
