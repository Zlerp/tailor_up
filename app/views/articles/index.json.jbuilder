json.array!(@articles) do |article|
  json.extract! article, :id, :kind, :quantity, :other, :appointment_id
  json.url article_url(article, format: :json)
end
