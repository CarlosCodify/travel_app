# frozen_string_literal: true

class VehicleModelsController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_manufacturer, only: %i[index create]
  before_action :set_vehicle_model, only: %i[show update destroy]

  # GET /vehicle_models
  def index
    @vehicle_models = VehicleModel.all

    render json: @vehicle_models
  end

  # GET /vehicle_models/1
  def show
    render json: @vehicle_model
  end

  # POST /vehicle_models
  def create
    @vehicle_model = @manufacturer.vehicle_models.new(vehicle_model_params)

    if @vehicle_model.save
      render json: @vehicle_model, status: :created
    else
      render json: @vehicle_model.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /vehicle_models/1
  def update
    if @vehicle_model.update(vehicle_model_params)
      render json: @vehicle_model
    else
      render json: @vehicle_model.errors, status: :unprocessable_entity
    end
  end

  # DELETE /vehicle_models/1
  def destroy
    @vehicle_model.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_vehicle_model
    @vehicle_model = VehicleModel.find(params[:id])
  end

  def set_manufacturer
    @manufacturer = Manufacturer.find(params[:manufacturer_id])
  end

  # Only allow a list of trusted parameters through.
  def vehicle_model_params
    params.require(:vehicle_model).permit(:name)
  end
end
