class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy, :status]

  # GET /appointments
  # GET /appointments.json
  def index
    @appointments = current_user.appointments.all
    # @appointments = Appointment.all
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
      @article = Article.new
      @appointment = current_tailor
  end

  # GET /appointments/new
  def new
    if current_user
      if current_user.appointments.count <= 0
        @appointment = current_user.appointments.new
        @appointment.address = current_user.address
        @appointment.zip = current_user.zip
        @appointment.appointment_time = params[:start]
        @appointment.tailor_id = params[:tailor_id]
        # DateTime.now.strftime("%Y-%d-%m %H:%M")
          @article = Article.new
      else
        redirect_to dashboard_path
      end
    end
  end




  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments
  # POST /appointments.json
  def create
    @appointment = current_user.appointments.new(appointment_params)
    availability = Availability.find(params[:availability_id])
    #  @appointment = Appointment.new(appointment_params)
    @appointment.tailor_id = params[:tailor_id]
    @appointment.stages = "Appointment Booked"


      if @appointment.pickup_location == ""
        @appointment.pickup_location = current_user.address
      end

    respond_to do |format|
      if @appointment.save
        UserMailer.appointment_booked(@appointment).deliver
        availability.requested = true
         availability.save
        format.html { redirect_to dashboard_path, notice: 'Appointment was successfully created.' }
        format.json { render :show, status: :created, location: @appointment }

      else
        format.html { render :new }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  def status
      if @appointment.stages == "Appointment Booked"
        @appointment.stages = "Processing Alterations"
        @appointment.save
        UserMailer.appointment_processing(@appointment).deliver
        redirect_to tailors_dashboard_path, flash:{notice: 'appointment status was changed from "Booked" to "Processing alterantions"'}
      elsif @appointment.stages == "Processing Alterations"
        @appointment.stages = "Ready for Drop Off"
        @appointment.save
        UserMailer.appointment_delivery(@appointment).deliver
        redirect_to tailors_dashboard_path, flash:{notice: 'appointment status was changed from "Processing alterantions" to "Ready for Drop Off"'}
      else @appointment.stages == "Ready for Drop Off"
        @appointment.stages = "Order Completed"
        @appointment.save
        UserMailer.appointment_complete(@appointment).deliver
        redirect_to tailors_dashboard_path, flash:{notice: 'appointment status was changed from "Ready for Drop Off" to "Order Completed"'}
      end
  end




  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment.articles.destroy_all   #Removes all articles associated to Appointment
    @appointment.destroy
    respond_to do |format|
      if current_user != nil
      format.html { redirect_to dashboard_path, notice: 'Appointment was successfully destroyed.' }
      format.json { head :no_content }

      end


    end
  end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
      # @appointment = current_user.appointments.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:tailor_id, :start, :stages, :address, :appointment_time, :due_time, :service, :pickup_location, :zip)
    end

end
