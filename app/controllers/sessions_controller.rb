class SessionsController < ApplicationController
    def new
    end
  
    def create
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to dashboard_path, notice: 'Logged in successfully.'
      else
        flash.now[:alert] = 'Invalid email or password'
        render :new
      end
    end
  
    def destroy
      # Log out the user by clearing session data
      session[:user_id] = nil
      flash[:notice] = "Logged out successfully!"
      redirect_to root_path # Redirect to home or login page
    end
end