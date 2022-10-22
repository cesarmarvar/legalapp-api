class LawyerSpecialitiesController < ApplicationController

  def create
    @lawyer_speciality = LawyerSpeciality.new(lawyer_speciality_params)

    if @lawyer_speciality.save
      render json: @lawyer_speciality, status: :created
    else
      render json: { errors: @lawyer_speciality.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @lawyer_speciality = Lawyer_speciality.find(params[:id])
    @lawyer_speciality.delete
    head :ok
  end

  private
  def lawyer_speciality_params
    params.permit(:lawyer_id, :speciality_id)
  end

end