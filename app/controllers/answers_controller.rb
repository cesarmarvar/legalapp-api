class AnswersController < ApplicationController
  skip_before_action :authorize, only: %i[index show get_lawyer_answers]
  before_action :set_answer, only: %i[show]

  def index 
    @answers = Answer.all
    render json: @answers
  end

  def create 
    @answer = Answer.new(answer_params)
    if @answer.save
      render json: @answer, status: :created
    else
      render json: { errors: @answer.errors }, status: :unprocessable_entity
    end
  end

  def show
    if @answer
      render json: @answer
    else
      render json: [], status: :not_found
    end
  end

  def get_lawyer_answers
    answers = Answer.where(lawyer_id: params[:id])
    if answers
      render json: answers
    else
      render json: [], status: :not_found
    end
  end
  

  private

  def set_answer
    data = Answer.find(params[:id])
    @answer = {
      id: data.id,
      answer: data.answer,
      lawyer_id: data.lawyer_id,
      lawyer_name: data.lawyer_name
    }
  end

  def answer_params
    params.permit(:answer, :question_id, :lawyer_id, :lawyer_name)
  end


end
