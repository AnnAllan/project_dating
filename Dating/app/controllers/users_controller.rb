class UsersController < ApplicationController
  def index
    @users = User.order(id: :desc)
    @current_user = User.find(5)
    @matching_users = matching_users
  end

  def show
    @user = User.find(params[:id])
    @current_user = User.find(5)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(safe_user_params)
    if @user.save
      flash[:success] = "User created."
      redirect_to users_path
    else
      flash.new[:error] = "Unable to create user. "
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    @current_user = User.find(5)
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(safe_user_params)
      flash[:success] = "User updated."
      redirect_to users_path
    else
      flash.now[:error] = "Unable to update user."
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destory
      flash[:success] = "User deleted."
      redirect_to users_path
    else
      flash.now[:error] = "Unable to delete user.  "
      render 'show'
    end
  end

  private
  def safe_user_params
    params.require(:user).permit(:first_name, :last_name, :user_name, :email, :phone, :credit_card, :gender_identity, :bio, {addresses_attributes: [:street_address, :secondary_address, :city, :state_abbr, :zip, :billing]})
  end

  def matching_users
    matching_users = []
    matching_users_ids = []
    partner_id = 0
    match_score = 0
    Score.find_each do |score|
      if score.user_id == @current_user.id
        partner_id = score.partner_id
        match_score = score.score
        if match_score > 0
          matching_users_ids << partner_id
        end
      end
    end
    matching_users_ids.each do |i|
      matching_users << User.find(i)
    end
    return matching_users
  end

end
