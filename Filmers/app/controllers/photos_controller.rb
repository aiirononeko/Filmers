class PhotosController < ApplicationController
  skip_before_action :login_required, only: %i[index show]
  before_action :set_photo, only: %i[show edit update destroy]

  def index
    @photos = Photo.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = current_user.photos.new(photo_params)

    if @photo.save
      redirect_to photos_path, notice: '個展を開催しました'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @photo.update(photo_params)
      redirect_to photos_path, notice: '個展を編集しました'
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @photo.user_id
      @photo.destroy
      redirect_to photos_path, notice: "#{@photo.title}を削除しました"
    else
      redirect_to photos_path, notice: '権限がありません'
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :image, :description)
  end

  def set_photo
    @photo = Photo.find(params[:id])
  end
end
