# frozen_string_literal: true

class SalesController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_sale, only: %i[show update destroy]

  # GET /sales
  def index
    @sales = Sale.all

    render json: @sales
  end

  # GET /sales/1
  def show
    render json: @sale.as_json(include: { tickets: { except: %i[created_at updated_at] } })
  end

  # POST /sales
  def create
    @sale = Sale.new(sale_params)
    if @sale.save
      generate_ticket(@sale, params[:seat_ids])

      render json: @sale.as_json(include: { tickets: { except: %i[created_at updated_at] } }), status: :created
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

  def generate_ticket(sale, seat_ids)
    price = sale.travel.route.price
    seats = Seat.where(id: seat_ids)
    sale.unitary_amount = price
    sale.total_amount = price * params[:seat_ids].count

    if seats.count > 1
      seats.each do |seat|
        sale.tickets.create(customer: sale.customer, seat: seat)
        seat.busy!
        seat.bus.drease!
        # GenerateTicket.perform_now(ticket) # TODO: Crear Job for generate ticket
      end
    else
      sale.tickets.create(customer: sale.customer, seat: seats.first)
      seats.first.busy!
      seats.first.bus.decrement!
      # GenerateTicket.perform_now(ticket) # TODO: Crear Job for generate ticket
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_sale
    @sale = Sale.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def sale_params
    params.require(:sale).permit(:total_amount, :unitary_amount, :sale_person_id, :customer_id, :travel_id)
  end
end
