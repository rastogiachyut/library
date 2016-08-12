class SessionsController < ApplicationController
  before_action :ensure_anonymous, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      if user.admin
        redirect_to admin_books_path, alert: "Hello admin #{ user.first_name }, you have been successfully loggedin!!"
      else
        redirect_to home_url, alert: "Hi #{ user.first_name }, you have been successfully loggedin!!"
      end
    else
      redirect_to login_url, alert: "Invalid or unverified user/password combination."
    end
  end

  def destroy
    # current_user.clear_remember_me_token!
    # cookies.delete :remember_me_token   
    reset_session
    redirect_to home_url, notice: "You have been logged out successfully"
  end

end
