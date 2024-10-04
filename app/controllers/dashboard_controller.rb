class DashboardController < ApplicationController
    before_action :require_login
  
    def index
      @patients = Patient.all
      @patient_count_by_day = Patient.group("DATE(created_at)").count
    end 
       
    private

  def require_login
    unless current_user
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_session_path
    end
  end

    def destroy
      session[:user_id] = nil
      redirect_to root_path, notice: 'Logged out successfully.'
    end
end