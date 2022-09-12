class Ride < ApplicationRecord
  belongs_to :amusement_park
  has_many :ride_mechanics
  has_many :mechanics, through: :ride_mechanics

  def self.ordered_alphabetically
    order(:name)
  end

  def self.average_thrill
    average(:thrill_rating)
  end
end