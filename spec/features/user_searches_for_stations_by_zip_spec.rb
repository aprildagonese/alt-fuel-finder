require "rails_helper"

feature "User searches for stations by zip" do
  scenario "with a valid zip" do
    visit "/"
    fill_in :q, with: "80203"
    click_on "Locate"
    expect(current_path).to eq "/search"
    expect(page).to have_css(".station", count: 10)

    # And the stations should be limited to Electric and Propane

    within(first(".station")) do
      within(".name") do
        expect(page).to have_content("UDR")
      end

      within(".address") do
        expect(page).to have_content("800 Acoma St, Denver, CO 80204")
      end

      within(".fuel_types") do
        expect(page).to have_content("ELEC")
      end

      within(".distance") do
        expect(page).to have_content("0.31422")
      end

      within(".access_times") do
        expect(page).to have_content("24 hours daily")
      end
    end
  end
end
