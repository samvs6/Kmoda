class Client < ActiveRecord::Base
  has_many :sales
  #validaciones de Ci
  validates :nit, uniqueness:{case_sensitive:false, message: ": El cliente con ese id ya existe"}, 
  			:presence => {message: ": No puede estar vacio"},
  			:numericality => {:only_integer => true, :message => ": Debe ser un numero"},
  			:numericality => {:greater_than => 9999, :message => ": Numero invalido",
  							  :less_than => 10000000000, :message => ": Numero invalido"}
  #validaciones de Nombre

  VALID_NAME_REGEX = /[a-zA-Z]+\z/i
  validates :nombre,:presence=>{message: ": No puede estar vacio"},
  			:length => { minimum:2, maximum: 50,
    		too_short: ": Debe tener almenos %{count} caracteres", too_long: ": Debe tener menos de %{count} caracteres" },
        format: {with: VALID_NAME_REGEX , message: ": Invalido"}
        
end
