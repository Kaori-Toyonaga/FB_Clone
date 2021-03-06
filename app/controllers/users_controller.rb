class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.image = "prof.png"
    if @user.save
      redirect_to user_path(@user.id)
      session[:user_id] = @user.id
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(icurrent_user), alert: "不正なアクセスです。"
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :image, :image_cache)
  end
end
