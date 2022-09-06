class PhotosController < ApplicationController

  def create
    result = Cloudinary::Uploader.upload(params[:image])

    photo = Photo.create(photoable_id: params[:photoable_id], image: result['url'])

    if photo.save
      render json: photo
    else
      render json: { errors: photo.errors }, status: :unprocessable_entity
    end
  end

end
