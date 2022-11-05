class LawyersController < ApplicationController
  skip_before_action :authorize, only: %i[index show query_filter]
  before_action :set_lawyer, only: %i[show]

  def index
    @lawyers = Lawyer.all.order(:id)
    render json: @lawyers
  end

  def create
    @lawyer = Lawyer.new(lawyer_params)
    if @lawyer.save
      render json: @lawyer, status: :created
    else
      render json: { errors: @lawyer.errors }, status: :unprocessable_entity
    end
  end

  def show
    if @lawyer
      render json: @lawyer
    else
      # render json: "Lawyer not found", status: :ok
      render json: [], status: :not_found
    end
  end

  def update
    lawyer = Lawyer.find(params[:id])

    if lawyer.update(lawyer_params)
      render json: lawyer, status: :ok
    else
      render json: { errors: lawyer.errors }, status: :unprocessable_entity
    end
  end

  def query_filter
    lawyers = Lawyer.all
    specialities = Speciality.all
    practice_lawyers = []
    if params[:query]
      name_filter = lawyers.filter{ |lawyer| lawyer[:lawyer_name].downcase.include?(params[:query].downcase) }
      practice_filter = specialities.filter{ |spec| spec[:speciality].downcase.include?(params[:query].downcase)}
      practice_filter.each do |p|
        p.lawyer_specialities.each do |n|
          practice_lawyers.push(n.lawyer)
        end
      end

      render json: name_filter + practice_lawyers

    else
      render json: { errors: "Debe haber al menos un caracter en la busqueda" }, status: :unprocessable_entity
    end
  end


  def destroy
    lawyer = Lawyer.find(params[:id])
    lawyer.delete
    head :ok
  end

  def get_lawyer_photo
    lawyer = Lawyer.find(params[:id])

    if lawyer.photos.size > 0
      render json: lawyer.photos
    else
      render json: { message: "Lawyer has no photos" }, status: :not_found
    end
  end

  private
  
  def set_lawyer
    data = Lawyer.find(params[:id])
    @lawyer = {
      id: data.id,
      user_id: data.user_id,
      lawyer_name: data.lawyer_name,
      years_licensed: data.years_licensed,
      bio: data.bio,
      credentials: data.credentials,
      payment_method: data.payment_method,
      social_media: data.social_media,
      state_location: data.state_location,
      office_address: data.office_address,
      office_phone: data.office_phone,
      cellphone: data.cellphone,
      email: data.email,
      image: data.image,
      score: {
        reviews_count: data.reviews_count,
        average_rating: data.average_rating,
      },
      coordinates: {
        lat: data.lat, 
        long: data.long
      }
    }
  end

  def lawyer_params
    params.permit(
    :user_id,
    :lawyer_name, 
    :years_licensed, 
    :bio, 
    :credentials, 
    :payment_method, 
    :social_media, 
    :state_location, 
    :office_address, 
    :office_phone, 
    :cellphone, 
    :email,
    :reviews_count,
    :average_rating,
    :lat, 
    :long, 
    :image
    )
  end


end
