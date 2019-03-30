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
    NrelService.new.get_stations_by_location(@zip)
  end

end
