class CommentsController < ApplicationController
  def create
    @user = :resource
    @comment = Comment.new(safe_comment_params)
    if @comment.save
      flash[:success] = "Comment created"
      redirect_to user_path(@user.id)
    else
      flash.now[:error] = "Comment could not be created."
      redirect_to user_path(@user.id)
    end
  end

  def edit
    @user = User.find(params[:id])
    @comment = Comment.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(safe_comment_params)
      flash[:success] = "Comment updated."
      redirect_to user_path(@user.id)
    else
      flash.now[:error] = "Comment could not be updated."
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:success] = "Comment deleted."
      redirect_to user_path(@user.id)
    else
      flash.now[:error] = "Comment could not be delted."
      redirect_to user_path(@user.id)
    end
  end

  private
  def safe_comment_params
    params.require(:comment).permit(:message, :user_id)
  end
end
