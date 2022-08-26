class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    
    if @user.save
      render @user.to_json(except: [:password_digest]), status: :created
    else
      render json: { errors: @user.errors }, status: :unprocessable_entity
    end
  end

  
  def show
    render json: @respond_user
  end
  
  def update
    if current_user.update(user_params)
      respond_user = {
        name: current_user.name,
        email: current_user.email
      }
      render json: respond_user, :status_ok
    else
      render json: {errors: current_user.errors }, status: :unprocessable_entity
  end
  
  def destroy
    current_user.destroy
    head :ok
  end
  
  
  private
  
  def set_user
    @respond_user = {
      name: current_user.name,
      email: current_user.email,
    }
  end

  def user_params
    params.permit(:name, :email, :password)
  end

end
