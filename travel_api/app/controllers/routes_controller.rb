# frozen_string_literal: true

class RoutesController < ApplicationController
  before_action :set_route, only: %i[show update destroy add_cities]

  # GET /routes
  def index
    @routes = Route.all

    render json: @routes
  end

  # GET /routes/1
  def show
    @route = Route.includes(:route_cities, :cities).find(params[:id])
    origin_city = @route.cities.where(route_cities: { origin: true }).first
    destination_city = @route.cities.where(route_cities: { destination: true }).first

    render json: {
      route: @route.as_json(except: %i[created_at updated_at]),
      origin_city: origin_city.as_json(except: %i[created_at updated_at]),
      destination_city: destination_city.as_json(except: %i[created_at updated_at])
    }
  end

  # POST /routes
  def create
    @route = Route.new(route_params)

    if @route.save
      render json: @route, status: :created
    else
      render json: @route.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /routes/1
  def update
    if @route.update(route_params)
      render json: @route
    else
      render json: @route.errors, status: :unprocessable_entity
    end
  end

  def add_cities
    origin = City.find(params[:origin_id])
    destination = City.find(params[:destination_id])

    @route.route_cities.build(city: origin, origin: true)
    @route.route_cities.build(city: destination, destination: true)

    @route.save

    render json: {
      route: @route.as_json(except: %i[created_at updated_at]),
      origen: origin.name,
      destino: destination.name
    }
  end

  # DELETE /routes/1
  def destroy
    @route.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_route
    @route = Route.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def route_params
    params.require(:route).permit(:name, :price, :distance)
  end
end
