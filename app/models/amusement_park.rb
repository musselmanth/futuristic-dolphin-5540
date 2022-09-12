class AmusementPark < ApplicationRecord
  has_many :rides

  def rides_ordered_alphabetically
    rides.ordered_alphabetically
  end

  def rides_average_thrill
    rides.average_thrill
  end
end