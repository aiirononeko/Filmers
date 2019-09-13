class LikesController < ApplicationController
  def create
    @like = current_user.likes.create(photo_id: params[:photo_id])
    flash[:notice] = "#{@like.photo.title}にLIKEをつけました！"
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = Like.find_by(photo_id: params[:photo_id], user_id: current_user.id)
    @like.destroy
    flash[:notice] = "#{@like.photo.title}のLIKEを取り消しました"
    redirect_back(fallback_location: root_path)
  end
end
