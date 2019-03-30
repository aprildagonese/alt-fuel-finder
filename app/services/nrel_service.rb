class NrelService
  def initialize(zip)
    @zip = zip
  end

  def get_location_data
    url = "/api/alt-fuel-stations/v1/nearest.json?location=#{@zip}"
    get_json(url)
  end

  def get_json(url)
    response = conn.get(url)
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

  private
  attr_reader :zip
end
