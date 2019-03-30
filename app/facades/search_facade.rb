class SearchFacade

  def initialize(zipcode)
    @zip = zipcode
  end

  def total_results
    get_stations[:total_results]
  end

  def stations
    get_stations[:fuel_stations].map do |station|
      Station.new(station)
    end
  end

  def get_stations
    # response = Faraday.get("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?limit=15&api_key=PUHb1tf8gyDhdoJISXBYpNgKrJ7xno0qjdfg2fnH&radius=5.0&fuel_type=ELEC,LPG&location=#{@zip}&access=public&status_code=E")
    # raw_data = JSON.parse(response.body, symbolize_names: true)

    service = NrelService.new(@zip)
    data = service.get_location_data
  end

  private
  attr_reader :zip
end
