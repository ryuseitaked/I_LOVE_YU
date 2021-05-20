#Geocoding APIを使用する事ができ、緯度経度の算出が高精度で行えます
Geocoder.configure(
  lookup: :google,
  api_key: ENV['GOOGLE_MAP_API']
)

