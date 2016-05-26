json.array!(@materials) do |material|
  json.extract! material, :id, :nombre, :tipo, :color, :cantidad
  json.url material_url(material, format: :json)
end
