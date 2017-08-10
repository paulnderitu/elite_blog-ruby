class QuestionsController < ApplicationController
  before_filter :authorize, only: %i[edit update]

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = 'Discussion added successfully!'
      redirect_to questions_path(@question)
    else
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
    render :edit
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      flash[:notice] = 'Discussion updated successfully!'
      redirect_to questions_path(@question)
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    flash[:notice] = 'Discussion destroyed successfully!'
    redirect_to questions_path(@question)
  end

  private

  def question_params
    params.require(:question).permit(:title, :link, :user_id)
  end
end
