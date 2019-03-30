class NrelService

  def get_stations_by_location(zip)
    url = "/v1/nearest.json?location=#{zip}"
    get_alt_fuel_json(url)
  end

  def get_alt_fuel_json(url = "")
    response = conn.get("/api/alt-fuel-stations#{url}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    conn = Faraday.new(url: 'https://developer.nrel.gov') do |faraday|
      faraday.adapter  Faraday.default_adapter
      faraday.params['api_key'] = ENV['NREL_KEY']
      faraday.params['fuel_type'] = 'ELEC,LPG'
      faraday.params['access'] = 'public'
      faraday.params['status_code'] = 'E'
      faraday.params['limit'] = 15
    end
  end

end
