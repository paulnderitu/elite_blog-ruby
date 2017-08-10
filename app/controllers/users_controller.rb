class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = 'Thanks for signing up!'
      redirect_to root_url
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :username, :password, :password_confirmation, :question_id)
  end
end
