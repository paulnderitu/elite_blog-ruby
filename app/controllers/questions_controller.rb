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

    
end
