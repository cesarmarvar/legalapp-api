class QuestionsController < ApplicationController
  skip_before_action :authorize, only: %i[index show get_user_questions get_question_answers]

  def index
    @questions = Question.all.order(:id)
    if @questions
      render json: @questions
    else
      render json: [], status: :not_found
    end
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      render json: @question, status: :created
    else
      render json: { errors: @question.errors }, status: :unprocessable_entity
    end
  end

  def show
    @question = Question.find(params[:id])
    if @question 
      render json: @question, status: :ok
    else
      render json: [], status: :not_found
    end
  end

  def get_user_questions
    questions = Question.where(user_id: params[:id])
    if questions
      render json: questions
    else
      render json: [], status: :not_found
    end
  end 

  def get_question_answers
    question = Question.find(params[:id])
    if question.answers
      render json: question.answers, status: :ok
    else
      render json: [], stats: :not_found
    end
  end

  private

  def question_params
    params.permit(:question, :explanation, :confirmation, :user_id)
  end
end
