class YearManufacturersController < ApplicationController
  before_action :set_vehicle_model, only: %i[ index create ]
  before_action :set_year_manufacturer, only: %i[ show update destroy ]

  # GET /year_manufacturers
  def index
    @year_manufacturers = YearManufacturer.all

    render json: @year_manufacturers
  end

  # GET /year_manufacturers/1
  def show
    render json: @year_manufacturer
  end

  # POST /year_manufacturers
  def create
    @year_manufacturer = YearManufacturer.new(year_manufacturer_params)

    if @year_manufacturer.save
      render json: @year_manufacturer, status: :created, location: @year_manufacturer
    else
      render json: @year_manufacturer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /year_manufacturers/1
  def update
    if @year_manufacturer.update(year_manufacturer_params)
      render json: @year_manufacturer
    else
      render json: @year_manufacturer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /year_manufacturers/1
  def destroy
    @year_manufacturer.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_year_manufacturer
      @year_manufacturer = YearManufacturer.find(params[:id])
    end

    def set_vehicle_model
      @vehicle_model = VehicleModel.find(params[:vehicle_model_id])
    end

    # Only allow a list of trusted parameters through.
    def year_manufacturer_params
      params.require(:year_manufacturer).permit(:year)
    end
end
