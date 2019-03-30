class Station
  attr_reader :name, :address, :fuel_types, :distance, :access_times
  def initialize(data)
    @name = data[:station_name]
    @address = "#{data[:street_address]} #{data[:city]} #{data[:state]}"
    @fuel_types = data[:fuel_type_code]
    @distance = "#{data[:distance].round(2)} miles"
    @access_times = data[:access_days_time]
  end
end
