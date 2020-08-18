class RemovePurchaseYearFromCars < ActiveRecord::Migration[6.0]
  def change
    remove_column :cars, :purchase_year, :integer
  end
end
