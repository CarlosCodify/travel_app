# frozen_string_literal: true

class ManufacturersController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_manufacturer, only: %i[show update destroy]

  # GET /manufacturers
  def index
    @manufacturers = Manufacturer.all

    render json: @manufacturers
  end

  # GET /manufacturers/1
  def show
    render json: @manufacturer
  end

  # POST /manufacturers
  def create
    @manufacturer = Manufacturer.new(manufacturer_params)

    if @manufacturer.save
      render json: @manufacturer, status: :created
    else
      render json: @manufacturer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /manufacturers/1
  def update
    if @manufacturer.update(manufacturer_params)
      render json: @manufacturer
    else
      render json: @manufacturer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /manufacturers/1
  def destroy
    @manufacturer.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_manufacturer
    @manufacturer = Manufacturer.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def manufacturer_params
    params.require(:manufacturer).permit(:name)
  end
end
