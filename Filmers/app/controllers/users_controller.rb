class UsersController < ApplicationController
  skip_before_action :login_required, only: %i[new index create]
  before_action :require_admin, only: %i[index]

  def index
    @users = User.all.order(created_at: :desc)
  end

  def show
    @user = User.find(params[:id])
    redirect_to user_path(current_user), notice: '権限がありません' unless current_user.id == @user.id

    @photos = current_user.photos
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to photos_path, notice: "#{@user.name}さん、Filmersへようこそ！"
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to photos_path, notice: "#{@user.name}さんの情報を更新しました"
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to photos_path, notice: "#{@user.name}さんのアカウントを削除しました"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def require_admin
    redirect_to root_url unless current_user.admin?
  end
end
