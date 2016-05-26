class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.string :nombre
      t.string :tipo
      t.string :color
      t.integer :cantidad

      t.timestamps null: false
    end
  end
end
