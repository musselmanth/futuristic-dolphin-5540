require 'rails_helper'

RSpec.describe AmusementPark, type: :model do
  describe 'relationships' do
    it { should have_many(:rides) }
  end

  before(:each) do
    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    @universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

    @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
    @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

    @teacups = @universal.rides.create!(name: 'Teacups', thrill_rating: 1, open: true)
    @jaws = @universal.rides.create!(name: 'Jaws', thrill_rating: 4, open: true)
  end

  describe 'instance methods' do
    describe '.rides_ordered_alphabetically' do
      it 'returns a list of its rides ordered alphabetically' do
        expect(@six_flags.rides_ordered_alphabetically).to eq([@ferris, @hurler, @scrambler])
        expect(@universal.rides_ordered_alphabetically).to eq([@jaws, @teacups])
      end
    end

    describe '.rides_average_thrill' do
      it 'returns the average thrill rating of all its rides' do
        expect(@six_flags.rides_average_thrill).to eq(6)
        expect(@universal.rides_average_thrill).to eq(2.5)
      end
    end
  end

end