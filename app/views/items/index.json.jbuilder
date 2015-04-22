json.array!(@items) do |item|
  json.extract! item, :id, :product_name, :quantity, :rate, :received
  json.url item_url(item, format: :json)
end
