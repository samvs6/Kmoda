json.array!(@products) do |product|
  json.extract! product, :id, :codigo, :nombre, :costo, :cantidad
  json.url product_url(product, format: :json)
end
