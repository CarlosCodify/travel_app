# frozen_string_literal: true

class SalesController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_sale, only: %i[show update destroy]

  # GET /sales
  def index
    @sales = Sale.joins(:sale_person, :travel, :customer).all
                 .select('sale_people.*, travels.*, customers.*, sales.*')
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
        ticket = sale.tickets.create(customer: sale.customer, seat: seat)
        seat.busy!
        seat.bus.decrement!

        pdf = Prawn::Document.new(page_size: [200, 130], margin: [5, 5, 5, 5])

        pdf.font_size 8
        pdf.move_down 10
        pdf.text "TRANSPORTE MARISCAL SANTA CRUZ:", align: :center, style: :bold
        pdf.move_down 5
        pdf.text "Nombre: #{ticket.customer.person.name} #{ticket.customer.person.last_name}"
        pdf.move_down 5
        pdf.text "Código: #{ticket.serial_number}"
        pdf.move_down 5
        pdf.text "Asiento: #{ticket.seat.seat_number}"
        pdf.move_down 5
        pdf.text "Origen: #{ticket.sale.travel.departure_city}"
        pdf.move_down 5
        pdf.text "Destino: #{ticket.sale.travel.arrival_city}"
        pdf.move_down 5
        pdf.text "Precio: #{ticket.sale.unitary_amount}"
        pdf.move_down 5
        pdf.text "Hora de Salida: #{ticket.sale.travel.departure_time}"
    
        pdf.render_file "#{Rails.public_path}/tickets/ticket_#{ticket.id}.pdf"
      end
    else
      ticket = sale.tickets.create(customer: sale.customer, seat: seats.first)
      seats.first.busy!
      seats.first.bus.decrement!
      
      pdf = Prawn::Document.new(page_size: [200, 130], margin: [5, 5, 5, 5])

      pdf.font_size 8
      pdf.move_down 10
      pdf.text "TRANSPORTE MARISCAL SANTA CRUZ:", align: :center, style: :bold
      pdf.move_down 5
      pdf.text "Nombre: #{ticket.customer.person.name} #{ticket.customer.person.last_name}"
      pdf.move_down 5
      pdf.text "Código: #{ticket.serial_number}"
      pdf.move_down 5
      pdf.text "Asiento: #{ticket.seat.seat_number}"
      pdf.move_down 5
      pdf.text "Origen: #{ticket.sale.travel.departure_city}"
      pdf.move_down 5
      pdf.text "Destino: #{ticket.sale.travel.arrival_city}"
      pdf.move_down 5
      pdf.text "Precio: #{ticket.sale.unitary_amount}"
      pdf.move_down 5
      pdf.text "Hora de Salida: #{ticket.sale.travel.departure_time}"

      pdf.render_file "#{Rails.public_path}/tickets/ticket_#{ticket.id}.pdf"
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
