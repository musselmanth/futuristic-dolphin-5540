class AmusementParksController < ApplicationController
  def show
    @amusement_park = AmusementPark.find(params[:amusement_park_id])
    @rides = @amusement_park.rides.ordered_alphabetically
  end
end