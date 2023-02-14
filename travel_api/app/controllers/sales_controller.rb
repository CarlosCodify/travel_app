# frozen_string_literal: true

class SalesController < ApplicationController
  before_action :set_sale, only: %i[show update destroy]

  # GET /sales
  def index
    @sales = Sale.all

    render json: @sales
  end

  # GET /sales/1
  def show
    render json: @sale
  end

  # POST /sales
  def create
    # TODO: Agregamos el params de travel_id y seat_ids para asignarlo al ticket, despues de realizarce la venta.
    @sale = Sale.new(sale_params)

    if @sale.save
      generate_ticket(@sale, params[:travel_id], params[:seat_ids])
      render json: @sale, status: :created, location: @sale
    else
      render json: @sale.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sales/1
  def update
    if @sale.update(sale_params)
      render json: @sale
    else
      render json: @sale.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sales/1
  def destroy
    @sale.destroy
  end

  private

  def generate_ticket(_sale, _travel_id, seat_ids)
    seats = Seat.where(id: seat_ids)
    if seats.count > 1
      seats.each do |seat|
        seats.tickets.create
        GenerateTicket.perform_now(seat) # TODO: Crear Job
      end
    else
      seats.first.tickets.create
      GenerateTicket.perform_now(seats.first) # TODO: Crear Job
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_sale
    @sale = Sale.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def sale_params
    params.require(:sale).permit(:total_amount, :unitary_amount, :sale_person_id, :customer_id)
  end
end
