class AddTipoToProduct < ActiveRecord::Migration
  def change
    add_column :products, :tipo, :string
  end
end
