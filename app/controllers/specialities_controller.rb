class SpecialitiesController < ApplicationController

  def create
    @speciality = Speciality.new(speciality_params)

    if @speciality.save
      render json: @speciality, status: :created
    else
      render json: { errors: @speciality.errors }, status: :unprocessable_entity
    end 
  end

  def index
    @specialities = Speciality.all
    render json: @specialities
  end

  def destroy
    speciality = Speciality.find(params[:id])
    speciality.delete
    head :ok
  end

  private
  def speciality_params
    params.permit(:speciality)
  end
end
