class ContactController < ApplicationController

  def index
    @contacts = Contact.all.order(:id)
    render json: @contacts
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      render json: @contact
    else
      render json: { errors: @contact.errors }, status: :unprocessable_entity
    end
  end

  def show
    @contact = Contact.find(params[:id])
    if @contact 
      render json: @contact
    else
      render json: [], status: :not_found
    end
  end

  def destroy
    contact = Contact.find(params[:id])
    contact.delete
    head :ok
  end


  private
  def contact_params
    params.permit(:username, :phone_number, :email, :title, :situation, :speciality, :location)
  end

end
