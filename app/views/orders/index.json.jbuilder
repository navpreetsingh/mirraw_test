json.array!(@orders) do |order|
  json.extract! order, :id, :number, :date, :customer_name
  json.url order_url(order, format: :json)
end
