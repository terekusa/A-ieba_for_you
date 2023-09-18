class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc).page(params[:page])
    @like_posts = current_user.like_posts.includes(:user).order(created_at: :desc).page(params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end
end
