class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string :model
      t.integer :purchase_year
      t.string :description
      t.integer :price
      t.references :user

      t.timestamps
    end
  end
end
