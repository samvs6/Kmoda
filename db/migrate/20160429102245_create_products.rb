class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :codigo
      t.string :nombre
      t.decimal :costo
      t.integer :cantidad

      t.timestamps null: false
    end
  end
end
