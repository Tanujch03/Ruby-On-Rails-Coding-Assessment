# Patients Controller (app/controllers/patients_controller.rb)
class PatientsController < ApplicationController
  before_action :require_login
  before_action :require_receptionist, except: [:index, :show]
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  def index
    @patients = Patient.all
  end

  def show
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to @patient, notice: 'Patient was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @patient.update(patient_params)
      redirect_to @patient, notice: 'Patient was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @patient.destroy
      redirect_to patients_path, notice: 'Patient was successfully deleted.'
    else
      redirect_to patient_path(@patient), alert: 'Error deleting patient.'
    end
  end

  private

  def set_patient
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:name, :age, :gender)
  end

  def require_receptionist
    unless current_user && current_user.role == 'receptionist'
      flash[:error] = "You must be a receptionist to perform this action"
      redirect_to dashboard_path
    end
  end
end