class AddColumnsToSale < ActiveRecord::Migration
  def change
    remove_column :sales, :product_id
    add_column :sales, :finished, :boolean
  end
end
