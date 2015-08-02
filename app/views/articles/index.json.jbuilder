json.array!(@articles) do |article|
  json.extract! article, :id, :type, :quantity, :other, :appointment_id
  json.url article_url(article, format: :json)
end
