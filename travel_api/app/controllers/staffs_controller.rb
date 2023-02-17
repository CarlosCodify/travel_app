# frozen_string_literal: true

class StaffsController < ApplicationController
  # before_action :authenticate_user!
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
    person = Person.new(staff_params)
    staff = person.build_staff

    @staff = case params[:type]
             when 'driver'
               driver = staff.build_driver(driver_licence: params[:driver_licence])
               user = driver.build_user(name: params[:name], email: params[:email], nickname: params[:nickname],
                                        password: params[:password], password_confirmation: params[:password_confirmation])
               driver
             when 'driver_assistant'
               driver_assistant = staff.build_driver_assistant
               user = driver_assistant.build_user(name: params[:name], email: params[:email], nickname: params[:nickname],
                                                  password: params[:password], password_confirmation: params[:password_confirmation])
               driver_assistant
             else
               sale_person = staff.build_sale_person
               user = sale_person.build_user(name: params[:name], email: params[:email], nickname: params[:nickname],
                                             password: params[:password], password_confirmation: params[:password_confirmation])
               sale_person
             end

    if @staff.save
      render json: {
        person: @staff.as_json(except: %i[created_at updated_at]),
        user: user.as_json(except: %i[created_at updated_at])
      }, status: :created
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
    @staff = case params[:type]
             when 'driver'
               Driver.find(params[:id])
             when 'driver_assistant'
               DriverAssistant.find(params[:id])
             else
               SalePerson.find(params[:id])
             end
  end

  # Only allow a list of trusted parameters through.
  def staff_params
    params.require(:staff).permit(:name, :last_name, :identity_document, :status, :birthday)
  end
end
