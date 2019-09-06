class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.date :date
      t.integer :user_id
      t.integer :restaurant_id
      t.string :name

      t.timestamps
    end
  end
end
