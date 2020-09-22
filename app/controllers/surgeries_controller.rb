class SurgeriesController < ApplicationController

  def index
    @surgeries = Surgery.all
  end

  def show
    @surgery = Surgery.find(params[:id])
    @surgeries_by_day = Surgery.where.not(id:@surgery.id).where(day:@surgery.day)
  end
end
