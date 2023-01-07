class UsersController < ApplicationController
  skip_before_action :authorize, only: %i[create index]

  def index
    users = User.all.order(:id)
    render json: users, status: :ok
  end

  def create
    @user = User.new(user_params)
    if @user.save
      user_data = {
        username: @user.username,
        email: @user.email,
        token: @user.token
      }

      render json: user_data, status: :created
    else
      render json: { errors: @user.errors }, status: :unprocessable_entity
    end
  end

  def show
    if current_user 
      render json: current_user.as_json(except: :password_digest)
    
    # if current_user
    #     user_with_id = {
    #       id: current_user.id  
    #       username: current_user.username,
    #       email: current_user.email,
    #     }
    #   render json: user_with_id
    else
      # render json: "Lawyer not found", status: :ok
      render json: [], status: :not_found
    end
  end
  
  def update
    if current_user.update(user_params)
      respond_user = {
        username: current_user.username,
        email: current_user.email
      }
      render json: respond_user, status: :ok
    else
      render json: {errors: current_user.errors }, status: :unprocessable_entity
    end
  end
  
  def get_users_lawyer
    if current_user.lawyer
      render json: current_user.lawyer
    else
      render json: { errors: current_user.errors }, status: :unprocessable_entity
    end
  end

  def get_user_photo
    if current_user.photos.size > 0
      render json: current_user.photos
    else
      render json: { message: "User has no photos" }, status: :not_found
    end
  end

  def destroy
    current_user.destroy
    head :ok
  end
  
  
  private

  def user_params
    params.permit(:username, :email, :password)
  end

end
