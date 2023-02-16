# frozen_string_literal: true

class BusesController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_bus, only: %i[show update destroy]

  # GET /buses
  def index
    @buses = Bus.all

    render json: @buses
  end

  # GET /buses/1
  def show
    render json: @bus.as_json(methods: :description)
  end

  # POST /buses
  def create
    @bus = Bus.new(bus_params)

    if @bus.save
      render json: @bus.as_json(methods: :description), status: :created
    else
      render json: @bus.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /buses/1
  def update
    if @bus.update(bus_params)
      render json: @bus.as_json(methods: :description)
    else
      render json: @bus.errors, status: :unprocessable_entity
    end
  end

  # DELETE /buses/1
  def destroy
    @bus.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_bus
    @bus = Bus.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def bus_params
    params.require(:bus).permit(:bus_type, :total_seats, :available_seats, :status, :year_manufacturer_id)
  end
end
