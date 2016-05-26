class Product < ActiveRecord::Base
  has_many :sales
  
  VALID_NAME_REGEX = /[a-zA-Z]+\z/i
  validates :codigo, uniqueness:{case_sensitive:false, message: ": El codigo ya existe"}, 
  			:presence => {message: ": No puede estar vacio"},
  			:numericality => {:only_integer => true, :message => ": Debe ser un numero"},
  			:numericality => {:greater_than => 1, :message => ": Numero invalido",
  							  :less_than => 100000000, :message => ": Numero invalido"}
  validates :nombre, :presence => {message: ": No puede estar vacio"},
			:length => { minimum:2	, maximum: 30,
			too_short: ": Debe tener almenos %{count} caracteres", too_long: ": Debe tener menos de %{count} caracteres" },
      format: {with: VALID_NAME_REGEX , message: ": Invalido"}
  validates :nombre, uniqueness:{case_sensitive:false, message: ": Ese nombre ya existe"}

  validates :tipo, :presence => {message: ": No puede estar vacio"},
			:length => { minimum:2	, maximum: 30,
			too_short: ": Debe tener almenos %{count} caracteres", too_long: ": Debe tener menos de %{count} caracteres" },
      format: {with: VALID_NAME_REGEX , message: ": Invalido"}    


  validates :costo, :presence => {message: ": No puede estar vacio"},
  			:numericality => {:only_float => true, :message => ": Debe ser un numero"}
 
  validates :cantidad, :presence => {message: ": No puede estar vacio"},
  			:numericality => {:only_integer => true, :message => ": Debe ser un numero", 
  			:greater_than => 0, :message => ": Numero invalido"}
end
