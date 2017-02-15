class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:edit, :update, :destroy]
  def index 
    @appointments = Appointment.all
  end 

  def new
    @doctors = Doctor.all.map { |d| [d.first_name, d.last_name, d.id] }
    @patients = Patient.all.map { |p| [p.first_name, p.last_name, p.id] }
    @appointments = Appointment.new 
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save 
      flash[:success] = 'New Appointment Added'
      redirect_to doctor_path(@appointment.doctor_id)
    else 
      render :new 
    end 
  end 

  def edit
    # @doctors = Doctor.all.map { |d| [d.first_name, d.last_name, d.id] }
    # @patients = Patient.all.map { |p| [p.first_name, p.last_name, p.id] }
  end 
  
  def update 
    if @appointment.update(appointment_params)
      redirect_to doctor_path(appointment.doctor_id), notice: 'Patient Updated'
    else 
      render :edit 
    end 
  end 


  def destroy 
    @appointment.destroy
    redirect_to :root
  end 

  private 
    def appointment_params 
      params.require(:appointment).permit(:doctor_id, :patient_id, :appointment_date, :appointment_time)
    end 

    def set_appointment
      @appointment = Appointment.find(params[:id])
    end 
end
