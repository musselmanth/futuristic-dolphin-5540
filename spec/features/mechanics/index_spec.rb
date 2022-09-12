include 'rails_helper'

RSpec.describe 'Mechanics Index', type: :feature do

  before(:each) do
    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    @universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80) 
      
    @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
    @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false) 
      
    @jaws = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)  
      
    @tim = Mechanic.create!(name: 'Tim Mechanicman', years_experience: 1)
    @betty = Mechanic.create!(name: 'Betty White', years_experience: 17)
    @woody = Mechanic.create!(name: 'Woody Harrison', years_experience: 5)

    @jaws.mechanics << [@tim, @betty]
    @ferris.mechanics << @woody
    
    visit("/mechanics")
  end

  it 'lists each mechanic name and years of experience' do
    within("div#mechanic-#{@tim.id}") {
      expect(page).to have_content(@tim.name)
      expect(page).to have_content("Years of Experience: 1")
    }
    within("div#mechanic-#{@betty.id}") {
      expect(page).to have_content(@betty.name)
      expect(page).to have_content("Years of Experience: 17")
    }
    within("div#mechanic-#{@woody.id}") {
      expect(page).to have_content(@woody.name)
      expect(page).to have_content("Years of Experience: 5")
    }
  end

  it 'lists the average experience for all mechanics' do
    expect(page).to have_content("Average Mechanic Experience: #{Mechanic.average_experience}")
  end
end