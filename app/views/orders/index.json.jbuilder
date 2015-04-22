json.array!(@orders) do |order|
  json.extract! order, :id, :name, :address, :email, :pay_type, :status
  json.url order_url(order, format: :json)
end
