class CommentsController < ApplicationController
  def new
    @comment = @commentable.comments.new
  end

  def create
    @klass = params[:comment][:commentable_type].constantize
    @commentable_id = params[:comment][:commentable_id]
    @commentable = @klass.find_by(id: @commentable_id)
    @comment = @commentable.comments.create(safe_comment_params)

    if @comment.save
      flash[:success] = "Comment created"
      redirect_to commentable_path
    else
      puts @user
      puts @comment.errors.full_messages

      flash.now[:error] = "Comment could not be created."
      redirect_back(fallback_location: root_path)
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
      puts user.errors.full_messages
      # flash[:error] = "Comment could not be updated."
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
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def safe_comment_params
    params.require(:comment).permit(:message, :user_id)
  end

  def commentable_path
    path_name = (@klass.to_s + '_path').downcase.to_sym
    send(path_name, @commentable_id)
  end
end
