require 'rails_helper'

RSpec.describe 'Mechanics Show Page', type: :feature do
  before(:each) do
    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
      
    @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
    @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 2, open: false) 
    @jaws = @six_flags.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)  
    
    @mechanic = Mechanic.create!(name: 'Mechanic Mechanicson', years_experience: 15)
    @mechanic.rides << [@hurler, @scrambler, @ferris, @jaws]

    visit("/mechanics/#{@mechanic.id}")
  end

  it 'lists the mechanics name and years of experience' do
    expect(page).to have_content(@mechanic.name)
    expect(page).to have_content("Years of Experience: #{@mechanic.years_experience}")
  end

  

  it 'lists only the mecahnics open rides' do
    expect(page).to have_content("Currently Working on Open Rides:")
    expect(page).to have_content(@scrambler.name)
    expect(page).to have_content(@hurler.name)
    expect(page).to have_content(@jaws.name)
    expect(page).to_not have_content(@ferris.name)
  end

  it 'lists the open rides in order of thrill rating (highest first)' do
    expect(@hurler.name).to appear_before(@jaws.name)
    expect(@jaws.name).to appear_before(@scrambler.name)
  end
  
end