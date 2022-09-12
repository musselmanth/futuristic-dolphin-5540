class MechanicsController < ApplicationController

  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:mechanic_id])
    @rides = @mechanic.open_rides_ordered_by_thrill
  end

end