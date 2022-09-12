require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe 'relationships' do
    it { should have_many(:ride_mechanics) }
    it { should have_many(:rides).through(:ride_mechanics) }
  end

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
  end

  describe 'class methods' do
    describe '#average_experience' do
      it 'returns the average exeperience for all mechanics' do
        expect(Mechanic.average_experience.round(2)).to eq(7.67)
      end

      it 'returns the average experience for a subset of mechanics' do
        expect(@jaws.mechanics.average_experience).to eq(9)
        expect(@ferris.mechanics.average_experience).to eq(5)
      end
    end
  end
end