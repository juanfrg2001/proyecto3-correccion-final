class WeightsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_weight, only: %i[ show edit update destroy ]


  def index
    unless current_user.nil?
      @weights = Weight.where(user_id: current_user.id)
    end
  end

  def result
    @weights = Weight.all.order(date_calory: :desc)

  end


  def edit
  end


  def new
    @weight = Weight.new
  end

  def create

    @weight = current_user.weights.new(weight_params)
    if @weight.save
      flash[:notice] = 'The weight was created succefull'
      redirect_to weights_path
    else
      flash.now[:notice] = 'OH NO!'
      redirect_to new_weight_path
    end
  end

  def show
  end

  def destroy
    @weight.destroy
    flash[:alert] = "The weight was delete"
    redirect_to weights_path
  end
  def update
    if @weight.update(weight_params)
      flash[:notice] = "The weight was update"
      redirect_to @weight
    else
      flash[:alert] = "Error"
    end
  end


  private

  def set_weight
    @weight = Weight.find(params[:id])
  end

  def weight_params
    params.require(:weight).permit(:weight, :date_weight, :years_old, :height, :sex, :description_weight)
  end
end
