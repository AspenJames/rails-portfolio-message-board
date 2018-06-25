class UsersController < ApplicationController
  before_action :require_login, :only => [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    set_user
  end

  def delete
    set_user
    check_user
  end

  def destroy
    set_user
    check_user
    @user.messages.each do |m|
      m.destroy
    end
    @user.created_boards.first.each do |b|
      b.messages.each do |m|
        m.destroy
      end
      b.destory
    end
    session.clear
    flash[:notice] = "User profile successfully deleted"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def check_user
    if current_user != @user
      flash[:alert] = "You are not authorized to edit or delete this user profile"
      redirect_to user_path(@user)
    end
  end

end
