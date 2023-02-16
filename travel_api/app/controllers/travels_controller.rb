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
    bus_description = "#{@travel.bus.manufacturer.name} #{@travel.bus.vehicle_model.name} (#{@travel.bus.year_manufacturer.year})"

    total_seats = @travel.bus.total_seats
    available_seats = total_seats - @travel.seats.where(availability: true).count

    available_seat_numbers = @travel.seats.where(availability: true).pluck(:seat_number)

    travel_info = {
      id: @travel.id,
      departure_city: @travel.departure_city,
      arrival_city: @travel.arrival_city,
      departure_time: @travel.departure_time,
      arrival_time: @travel.arrival_time,
      bus_description: bus_description,
      bus_type: @travel.bus.bus_type,
      total_seats: total_seats,
      available_seats: available_seats,
      available_seat_numbers: available_seat_numbers
    }

    render json: travel_info
  end

  # POST /travels
  def create
    @travel = Travel.new(travel_params)
    @bus = Bus.find(travel_params[:bus_id])
    total_seats = @bus.total_seats
    @travel.departure_city = find_origin(@travel.route)
    @travel.arrival_city = find_destination(@travel.route)

    if @travel.save
      (1..total_seats).each do |seat_number|
        @travel.seats.create(seat_number: seat_number, bus: @bus)
      end

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

  def find_origin(route)
    route.route_cities.find_by(origin: true).city.name
  end

  def find_destination(route)
    route.route_cities.find_by(destination: true).city.name
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_travel
    @travel = Travel.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def travel_params
    params.require(:travel).permit(:departure_time, :arrival_time, :departure_city, :arrival_city,
                                   :status, :bus_id, :route_id, :driver_id, :driver_assistant_id)
  end
end
