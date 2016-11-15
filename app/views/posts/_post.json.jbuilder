json.extract! post, :id, :title, :post, :address, :user_id, :created_at, :updated_at, :price
json.url post_url(post, format: :json)