class UsersController < ApplicationController
  before_action :require_login, :except => [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params(:name, :username, :email, :password))
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

  def edit
    set_user
    check_user
  end

  def update
    set_user
    check_user
    if @user.authenticate(params[:user][:password])
      if @user.update(user_params(:name, :username, :email, :password))
        flash[:notice] = "Profile successfully updated"
        redirect_to user_path(@user)
      else
        render :edit
      end
    else
      flash[:alert] = "Incorrect password"
      redirect_to edit_user_path(@user)
    end
  end

  def delete
    # this displays a warning message to the user before deleting their profile
    set_user
    check_user
  end

  def destroy
    set_user
    # the iterator below destroys each of a user's messages
    @user.messages.each do |m|
      m.destroy
    end
    @user.created_boards.first.each do |b|
      b.messages.each do |m|
        m.destroy # destroys all messages on boards created by this user
      end
      b.destroy # destroys the boards created by this user
    end
    session.clear # clears the session - logs user out
    @user.destroy # actually deletes the user
    flash[:notice] = "User profile successfully deleted"
    redirect_to root_path
  end

  private

  def user_params(*args)
    params.require(:user).permit(*args)
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
