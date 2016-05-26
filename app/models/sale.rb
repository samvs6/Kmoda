class Sale < ActiveRecord::Base
  belongs_to :client
  belongs_to :product
  has_many :sale_products
 
  
end
