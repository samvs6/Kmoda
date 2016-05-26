class Material < ActiveRecord::Base
	
	VALID_NAME_REGEX = /[a-zA-Z]+\z/i
	
	validates :nombre, :presence => {message: ": No puede estar vacio"},
			  :length => { minimum:5, maximum: 30,
			  too_short: ": Debe tener almenos %{count} caracteres", too_long: ": Debe tener menos de %{count} caracteres" },
			  format: {with: VALID_NAME_REGEX , message: ": Invalido"}
	validates :nombre, uniqueness:{case_sensitive:false, message: ": Ese nombre ya existe"}


	validates :tipo, :presence => {message: ": No puede estar vacio"},
			  :length => { minimum:5, maximum: 20,
			  too_short: ": Debe tener almenos %{count} caracteres", too_long: ": Debe tener menos de %{count} caracteres" },
			  format: {with: VALID_NAME_REGEX , message: ": Invalido"}
	validates :tipo, uniqueness:{case_sensitive:false, message: ": Ese nombre ya existe"}

	validates :color, :presence => {message: ": No puede estar vacio"},
			  :length => { minimum:5, maximum: 30,
			  too_short: ": Debe tener almenos %{count} caracteres", too_long: ": Debe tener menos de %{count} caracteres" },
			  format: {with: VALID_NAME_REGEX , message: ": Invalido"}
	validates :color, uniqueness:{case_sensitive:false, message: ": Ese nombre ya existe"}


	validates :cantidad, :presence => {message: ": No puede estar vacio"},
  			   :numericality => {:only_integer => true, :message => ": Debe ser un numero",
  			   :greater_than => 1, :message => ": Numero invalido"}
end
