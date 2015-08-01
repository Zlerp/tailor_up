json.array!(@appointments) do |appointment|
  json.extract! appointment, :id, :stages, :address, :appointment_time, :due_time, :service, :pickup_location
  json.url appointment_url(appointment, format: :json)
end
