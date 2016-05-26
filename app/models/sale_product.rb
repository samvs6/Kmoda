class SaleProduct < ActiveRecord::Base
  belongs_to :sale
  belongs_to :product
  
  after_create :modificar
   
  def modificar
    if(self.amount!=nil)
      a = Product.where(nombre: self.product.nombre).take
      a.cantidad = a.cantidad - self.amount
      a.save
    end
  end 	
end
