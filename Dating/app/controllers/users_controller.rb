class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])

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
end
