require 'rails_helper'

feature "User can search for stations" do
  it "by zip code" do
    # As a user
    # When I visit "/"
    # And I fill in the search form with 80206 (Note: Use the existing search form)
    # And I click "Locate"
    # Then I should be on page "/search"
    # Then I should see the total results of the stations that match my query.
    # Then I should see a list of the 15 closest stations within 5 miles sorted by distance
    # And the stations should be limited to Electric and Propane
    # And the stations should only be public, and not private, planned or temporarily unavailable.
    # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times

    visit search_path

    save_and_open_page
    fill_in :q, with: "80206"
    click_button "Locate"

    expect(current_path).to eq(search_path)
    expect(page).to have_content("Total results: 87")
    expect(page).to have_css(".station", count: 15)
    expect(page).to have_css(".name")
    expect(page).to have_css(".address")
    expect(page).to have_css(".fuel_types")
    expect(page).to have_css(".distance")
    expect(page).to have_css(".access_times")
  end
end
