class WeightsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_weight, only: %i[ show edit update destroy ]


  def index
    unless current_user.nil?
      @weights = Weight.all.order(date_weight: :desc)
      @chart_weight = current_user.weights.group_by_day(:date_weight, format: "%a").count
    end
  end

  def edit
  end

  def chart
    @weights = Weight.where(user_id: current_user.id)
  end


  def new
    @weight = Weight.new
  end

  def create
    @weight = current_user.weights.new(weight_params)
    if @weight.save
      flash.now[:success] = 'The article was created succefull'
      redirect_to weights_path
    else
      flash.now[:alert] = 'OH NO!'
      redirect_to new_weight_path
    end
  end

  def show
  end

  def destroy
    @weight.destroy
    flash[:notice] = "The post was delete"
    redirect_to weights_path
  end
  def update
    if @weight.update(weight_params)
      redirect_to @weight
    else
      flash[:error] = "Error"
    end
  end


  private

  def set_weight
    @weight = Weight.find(params[:id])
  end

  def weight_params
    params.require(:weight).permit(:eat_calorie, :burn_calorie, :comment_calories_eaten, :comment_calories_burned ,:date)
  end
end
