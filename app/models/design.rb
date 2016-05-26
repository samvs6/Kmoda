class Design < ActiveRecord::Base

	#validaciones de nombre
	VALID_NAME_REGEX = /[a-zA-Z]+\z/i
	validates :nombre, :presence => {message: ": No puede estar vacio"},
			  :length => { minimum:5, maximum: 30,
			  too_short: ": Debe tener almenos %{count} caracteres", too_long: ": Debe tener menos de %{count} caracteres" },
			  format: {with: VALID_NAME_REGEX , message: ": Invalido"}

	validates :nombre, uniqueness:{case_sensitive:false, message: ": Ese nombre ya existe"}

	#validaciones de descripcion

	validates :descripcion, :presence => {message: ": No puede estar vacio"},
			  :length => { minimum:5, maximum: 50,
			  too_short: ": Debe tener almenos %{count} caracteres", too_long: ": Debe tener menos de %{count} caracteres" },
			  format: {with: VALID_NAME_REGEX , message: ": Invalido"}

	#validaciones de imagen
	validates :image, :presence => {message: "n : Debe tener un diseño"}
	has_attached_file :image, styles: {large: "600x600>", medium: "300x300>", thumb: "150x150#"}
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
