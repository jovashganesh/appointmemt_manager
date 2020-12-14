class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  #show all appointments on index page
  def index
    @appointment = Appointment.all
  end

  #show comments (model) in the show page
  def show
    @comment = Comment.new
  end

  #show all appointments on show page
  def showall
    if current_user.admin?
      @appointment = Appointment.all
    else
      @appointment = current_user.appointments.where(user_id: current_user)
    end
  end

  # make new appointment instance
  def new
    @appointment = Appointment.new
  end

  # edit appointment
  def edit
  end

  # make new appointment and assign user id to that specific appointment
  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.user_id = current_user.id

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  #edit the appointment and update it in database
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  #cancel the appointment (delete)
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_path, notice: 'Appointment was successfully destroyed.' }
    end
  end

  private
    # find specific appointment and make an instance of it
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # when creating appointment these specific fields must not be empty
    def appointment_params
      params.require(:appointment).permit(:name, :start_time, :end_time, :user_id)
    end
end
