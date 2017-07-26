class LikesController < ApplicationController
  def Create
    @like = Like.new(safe_like_params)
    if @like.save
      flash[:success] = "Like created."
      redirect_back(fallback_location: root_path)
    else
      flash.new[:error] = "Unable to like user. "
      redirect_back(fallback_location: root_path)
    end

  end

  def Destroy
  end

  private
  def safe_like_params
    params.require(:like).permit(:liker_id, :liked_id)
  end
end
