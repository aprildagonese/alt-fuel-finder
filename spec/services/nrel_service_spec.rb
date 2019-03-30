require 'rails_helper'

describe "NREL Service", type: :service do
  it "gets station data" do
    response = NrelService.new.get_stations_by_location("80202")
    stations_array = response[:fuel_stations]

    expect(stations_array.count).to eq(15)

    stations_array.each do |station|
      expect(station[:distance]).to be <= 5.0
      expect(station[:fuel_type_code]).to eq("ELEC" || "LPG")
      expect(station[:access_code]).to eq("public")
      expect(station[:status_code]).to eq("E")
    end
  end
end
