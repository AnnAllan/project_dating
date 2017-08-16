class LikesController < ApplicationController
  def create
    @like = Like.create(safe_like_params)
    if @like.save
      flash[:success] = "Like created."
      redirect_back(fallback_location: root_path)
    else
      flash[:error] = "Unable to like user. "
      redirect_back(fallback_location: root_path)
    end

  end

  def destroy
    @users = User.order(id: :desc)
    @current_user = User.find(5)
    @like = Like.where(liker_id: @current_user.id)
                  .where(liked_id: @user.id).first
    if @like.destroy
      redirect_to user_path(@user.id)
    else
      flash.now[:error] = "Unable to unlike user."
      render 'show'
    end
  end

  private
  def safe_like_params
    params.require(:like).permit(:liker_id, :liked_id)
  end
end
