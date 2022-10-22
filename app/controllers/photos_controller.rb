class PhotosController < ApplicationController

  def create
    photo = Photo.new(photo_params)

    if photo.save
      render json: photo
    else
      render json: { errors: photo.errors }, status: :unprocessable_entity
    end
  end

  private

  def photo_params
    params.permit(:image, :photoable_id, :photoable_type)
  end

end
