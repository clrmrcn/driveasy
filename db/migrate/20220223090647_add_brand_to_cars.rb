class AddBrandToCars < ActiveRecord::Migration[6.1]
  def change
    add_column :cars, :brand, :string
  end
end
