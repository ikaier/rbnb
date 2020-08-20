class ChangeDescriptionInCars < ActiveRecord::Migration[6.0]
  def change
    change_column :cars, :description, :text
  end
end
