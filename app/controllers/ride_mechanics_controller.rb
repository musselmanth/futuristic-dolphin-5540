class RideMechanicsController < ApplicationController
  def create
    RideMechanic.create!(ride_mechanics_params)
    redirect_to("/mechanics/#{params[:mechanic_id]}")
  end

  private

  def ride_mechanics_params
    params.permit(:ride_id, :mechanic_id)
  end
end