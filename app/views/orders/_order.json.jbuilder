json.extract! order, :id, :user_id, :total, :status, :shipping_address, :shipping_city, :shipping_zip, :shipping_country, :created_at, :updated_at
json.url order_url(order, format: :json)
