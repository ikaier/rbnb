class RemovePurchaseYearFromCars < ActiveRecord::Migration[6.0]
  def change
    remove_column :cars, :Purchase_year, :integer
  end
end
