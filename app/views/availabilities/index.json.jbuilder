json.array!(@appointments) do |appointment|
  json.extract! event, :service, :appointment_time
  json.start event.start_time
  json.end event.end_time
  json.url event_url(event, format: :html)
end
