json.array!(@designs) do |design|
  json.extract! design, :id, :nombre, :descripcion
  json.url design_url(design, format: :json)
end
