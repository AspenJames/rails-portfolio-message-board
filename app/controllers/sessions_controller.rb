class SessionsController < ApplicationController

  def new
  end

  def create
    if auth_hash
      @user = User.find_or_create_by(:uid => auth_hash[:uid], :provider => auth_hash[:provider]) do |u|
        u.username = auth_hash[:info][:nickname]
        u.name = auth_hash[:info][:name]
        u.email = auth_hash[:info][:email]
        u.password = SecureRandom.hex(16)
        if auth_hash[:info][:email].nil?
          # If a GitHub user's email is set to private, it
          # will return nil for the above parameter.
          # Setting a uniquely-generated email below fakes
          # a valid email to allow creating a user + logging in.
          u.email = "#{u.username}@noemail.com"
        end
      end
      session[:user_id] = @user.id
      redirect_to root_path
    else
      @user = User.find_by(:username => params[:user][:username])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to root_path
      else
        flash[:alert] = "Incorrect username and/or password"
        render :new
      end
    end
  end

  def destory
    session.clear
    redirect_to root_path
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end


end
