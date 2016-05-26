class CreateDesigns < ActiveRecord::Migration
  def change
    create_table :designs do |t|
      t.string :nombre
      t.string :descripcion

      t.timestamps null: false
    end
  end
end
