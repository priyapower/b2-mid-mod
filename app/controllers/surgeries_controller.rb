class SurgeriesController < ApplicationController

  def index
    @surgeries = Surgery.all
  end

  def show
    @surgery = Surgery.find(params[:id])
    @surgeries_by_day = Surgery.where.not(id:@surgery.id).where(day:@surgery.day)
  end

  def update_doctor
    surgery = Surgery.find(params[:id])
    add_doctor = Doctor.find_by(name:doctor_params[:doctor_name])
    surgery.surgery_doctors.create(doctor:add_doctor)
    redirect_to "/surgeries/#{surgery.id}"
  end

  private

  def doctor_params
    params.permit(:doctor_name)
  end
end
