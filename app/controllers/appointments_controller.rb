class AppointmentsController < ApplicationController
  def new
    @doctors = Doctor.all.map { |d| [d.first_name, d.last_name, d.id] }
    @patients = Patient.all.map { |p| [p.first_name, p.last_name, p.id] }
    @appointments = Appointment.new 
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save 
      flash[:success] = 'New Appointment Added'
      redirect_to patients_path
    else 
      render :new 
    end 
  end 

  def destroy 
    appointment = Appointment.find(params[:id])
    appointment.destroy
    redirect_to doctor_path(appointment.doctor_id)
  end 

  private 
    def appointment_params 
      params.require(:appointment).permit(:doctor_id, :patient_id, :appointment_date, :appointment_time)
    end 
end
