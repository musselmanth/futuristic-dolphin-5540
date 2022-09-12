require 'rails_helper'

RSpec.describe Ride, type: :model do
  describe 'relationships' do
    it { should belong_to(:amusement_park) }
    it { should have_many(:ride_mechanics) }
    it { should have_many(:mechanics).through(:ride_mechanics) }
  end

  before(:each) do
    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)

    @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
    @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 2, open: false)
  end

  describe 'class methods' do
    describe '#ordered_alphabetically' do
      it 'returns all rides ordered alphabetically' do
        expect(Ride.ordered_alphabetically).to eq([@ferris, @hurler, @scrambler])
      end

      it 'returns the average thrill for all the rides' do
        expect(Ride.average_thrill.round(2)).to eq(4.33)
      end
    end
  end
end