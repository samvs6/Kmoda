class CreateSaleProducts < ActiveRecord::Migration
  def change
    create_table :sale_products do |t|
      t.references :sale, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true
      t.integer :amount

      t.timestamps null: false
    end
  end
end
