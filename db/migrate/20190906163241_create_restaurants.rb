class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :location
      t.string :categories
      t.string :price
      t.integer :avg_review

      t.timestamps
    end
  end
end
