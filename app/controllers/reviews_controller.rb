class ReviewsController < ApplicationController
  skip_before_action :authorize, only: %i[ index create show]
  before_action :set_review, only: %i[ show destroy ]

  # Shows a specific lawyer's reviews:
  def index
    reviews = Review.where(lawyer_id: params[:id])
    if reviews
      render json: reviews
    else
      render json: [], status: :not_found
    end
  end

  def create
    @review = Review.new(review_params)
    @lawyer = Lawyer.find(params[:lawyer_id])
    if @review.save
      @lawyer.update(average_rating: @lawyer.reviews.average(:rating).to_f)
      render json: @review, status: :created
    else
      render json: { errors: @review.errors }, status: :unprocessable_entity
    end
  end

  # Shows a single review's detail:
  def show
    if @review
      render json: @review
    else
      render json: [], status: :not_found
    end
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    head :ok
  end

  private
  
  def set_review
    data = Review.find(params[:id])
    @review = {
      id: data.id,
      rating: data.rating,
      title: data.title,
      content: data.content,
      context: data.context,
      name: data.name,
      email: data.email,
      lawyer_id: data.lawyer_id,
      user_id: data.user_id
    }
  end

  def review_params
    params.permit(
    :rating, 
    :title, 
    :content, 
    :context, 
    :name, 
    :email, 
    :lawyer_id, 
    :user_id 
    )
  end

end
