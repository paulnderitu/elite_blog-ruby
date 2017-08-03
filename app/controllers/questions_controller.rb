class QuestionsController < ApplicationController
    def index
      @questions = Question.all
      render :index
    end

    def show
      @question = Question.find(params[:id])
      render :show
    end

    def new
      @question = Question.new
      render :new
    end

    def create
      @question = Question.new(question_params)
      if @question.save
        redirect_to  questions_path
      else
        render :new
      end
    end

    def edit
      @question=Question.find(params[:id])
      render :edit
    end

  private
    def question_params
      params.require(:question).permit(:title)
    end
end
