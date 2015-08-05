json.array!(@availabilities) do |availability|
  json.extract! availability, :user_id, :start, :end, :booked
  json.start availability.start_time
  json.end availability.end_time
  json.url availability_url(availability, format: :html)
end
