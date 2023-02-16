# frozen_string_literal: true

class StaffsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_staff, only: %i[show update destroy]

  # GET /staffs
  def index
    @staffs = Staff.all

    render json: @staffs
  end

  # GET /staffs/1
  def show
    render json: @staff
  end

  # POST /staffs
  def create
    # ? Aquí recibiremos un parametro que idica el tipo de staff que se debe crear
    person = Person.build(staff_params)
    staff = person.staff.build

    @staff = case params[:type]
             when 'driver'
               staff.driver.build(driver_licence: staff_params[:driver_licence])
             when 'driver_assistant'
               staff.driver_assistant.build
             else
               staff.sale_person.build
             end

    if @staff.save
      render json: @staff, status: :created
    else
      render json: @staff.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /staffs/1
  def update
    if @staff.update(staff_params)
      render json: @staff
    else
      render json: @staff.errors, status: :unprocessable_entity
    end
  end

  # DELETE /staffs/1
  def destroy
    @staff.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_staff
    @staff = Staff.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def staff_params
    params.require(:staff).permit(:name, :last_name, :identity_document, :status, :birthday, :driver_licence)
  end
end
