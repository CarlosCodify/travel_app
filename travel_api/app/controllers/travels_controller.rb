# frozen_string_literal: true

class TravelsController < ApplicationController
  before_action :set_travel, only: %i[show update destroy]

  # GET /travels
  def index
    @travels = Travel.all

    render json: @travels
  end

  # GET /travels/1
  def show
    render json: @travel
  end

  # POST /travels
  def create
    @travel = Travel.new(travel_params)

    if @travel.save
      render json: @travel, status: :created
    else
      render json: @travel.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /travels/1
  def update
    if @travel.update(travel_params)
      render json: @travel
    else
      render json: @travel.errors, status: :unprocessable_entity
    end
  end

  # DELETE /travels/1
  def destroy
    @travel.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_travel
    @travel = Travel.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def travel_params
    params.require(:route).permit(:departure_time, :arrival_time, :departure_city, :arrival_city,
                                  :status, :bus_id, :route_id, :driver_id, :driver_assistant_id)
  end
end
