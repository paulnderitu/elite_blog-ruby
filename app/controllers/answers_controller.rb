class AnswersController < ApplicationController
  before_filter :authorize, only: %i[edit update]
  def new
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    if @answer.save
      flash[:notice] = 'Comment added successfully!'
      redirect_to question_path(@answer.question)
    else
      render :new
    end
  end

  def edit
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
  end

  def update
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    if @answer.update(answer_params)
      flash[:notice] = 'Comment updated successfully!'
      redirect_to question_path(@question)
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    @answer.destroy
    flash[:notice] = 'Comment destroyed successfully!'
    redirect_to question_path(@question)
  end

  private

  def answer_params
    params.require(:answer).permit(:description, :user_id)
  end
end
