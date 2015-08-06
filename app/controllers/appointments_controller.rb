class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  # GET /appointments
  # GET /appointments.json
  def index
    @appointments = current_user.appointments.all
    # @appointments = Appointment.all
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
<<<<<<< HEAD
      @article = Article.new

=======
      @artricle = Article.new
      @appointment = current_tailor
>>>>>>> 1bec83b0cdcb18c9662b0686e30f77200d99e207
  end

  # GET /appointments/new
  def new
    if current_user
      if current_user.appointments.count <= 0
        @appointment = current_user.appointments.new
        @appointment.address = current_user.address
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
    #  @appointment = Appointment.new(appointment_params)
    @appointment.stages = "Appointment Booked"
      if @appointment.pickup_location == ""
        @appointment.pickup_location = current_user.address
      end

    respond_to do |format|
      if @appointment.save
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

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
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
      params.require(:appointment).permit(:stages, :address, :appointment_time, :due_time, :service, :pickup_location, :zip)
    end

end
