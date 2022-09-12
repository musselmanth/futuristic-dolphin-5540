require 'rails_helper'

RSpec.describe 'Amusement Parks Show Page', type: :feature do
  before(:each) do
    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)

    @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
    @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

    visit("/amusement_parks/#{@six_flags.id}")
  end

  it 'has shows the amusement park name and admissions rate' do
    expect(page).to have_content(@six_flags.name)
    expect(page).to have_content("Admissions: #{number_to_currency(@six_flags.admission_cost)}")
  end

  it 'lists the rides for the amusement park' do
    expect(page).to have_content("Rides: ")
    expect(page).to have_content(@hurler.name)
    expect(page).to have_content(@scrambler.name)
    expect(page).to have_content(@ferris.name)
  end

  it 'lists them in alphabetical order' do
    expect(@ferris.name).to appear_before(@hurler.name)
    expect(@hurler.name).to appear_before(@scrambler.name)
  end

  it 'shows the average thrill rating for the rides' do
    expect(page).to have_content("Average Thrill Rating of the Rides: #{@six_flags.rides_average_thrill.round(2)}")
  end
end