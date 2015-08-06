class AvailabilitiesController < ApplicationController

  before_action :set_availability, only: [:show, :edit, :update, :destroy]

  # GET /availabilities
  # GET /availabilities.json
  def index
    @availabilities = Availability.all
  end

  # GET /availabilities/1
  # GET /availabilities/1.json
  def show
    @availabilties = current_tailor.Availability.all
  end

  # GET /availabilities/new
  def new
    @tailors = current_company.tailors
    @availability = Availability.new
    @availabilities = current_tailor.availabilities

    unless current_company
      if current_tailor
        redirect_to tailor_path
      else
        redirect_to root_path
      end
    end
  end

  # GET /availabilities/1/edit
  def edit

  end

  # POST /availabilities
  # POST /availabilities.json
  def create
    @availability = current_tailor.availabilities.new(availability_params)

    if @availability.end.nil?
      @availability.end = @availability.start + 1.hour
    end

    # current_user.generate(params[:days], params[:time])
    # redirect_to root_path
    respond_to do |format|
      if @availability.save
        format.html { redirect_to @availability, notice: 'Availability was successfully created.' }
        format.json { render :show, status: :created, location: @availability }
      else
        format.html { render :new }
        format.json { render json: @availability.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /availabilities/1
  # PATCH/PUT /availabilities/1.json
  def update
    respond_to do |format|
      if @availability.update(availability_params)
        format.html { redirect_to @availability, notice: 'Availability was successfully updated.' }
        format.json { render :show, status: :ok, location: @availability }
      else
        format.html { render :edit }
        format.json { render json: @availability.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /availabilities/1
  # DELETE /availabilities/1.json
  def destroy
    @availability.destroy
    respond_to do |format|
      format.html { redirect_to availabilities_url, notice: 'Availability was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_availability
    @availability = Availability.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def availability_params
    params.require(:availability).permit(:booked, :tailor_id, :start, :end, :user_id)
  end
end
