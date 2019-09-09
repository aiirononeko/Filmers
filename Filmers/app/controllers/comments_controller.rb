class CommentsController < ApplicationController
  def create
    @photo = Photo.find_by(params[:id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.photo_id = @photo.id
    if @comment.save
      redirect_to photo_path(@photo), notice: 'コメントを投稿しました'
    else
      render photo_path(@photo)
      flash[:notice] = 'コメントを投稿できませんでした'
    end
  end

  def destroy
    @comment = Comment.find_by(photo_id: params[:id], user_id: current_user.id)
    @comment.destroy
    redirect_to photo_path, notice: 'コメントを削除しました'
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
