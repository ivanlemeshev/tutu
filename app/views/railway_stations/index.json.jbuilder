json.array!(@railway_stations) do |railway_station|
  json.extract! railway_station, :id, :title
  json.url railway_station_url(railway_station, format: :json)
end
