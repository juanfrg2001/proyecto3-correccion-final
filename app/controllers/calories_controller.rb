class CaloriesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_calory, only: %i[ show edit update destroy ]
  def index
    unless current_user.nil?
    @calories = Calory.where(user_id: current_user.id)
    end
  end
  def chart
    unless current_user.nil?
      @calories = Calory.where(user_id: current_user.id)
    end
  end

  def new
    @calory = Calory.new
  end

  def create
    @calory = current_user.calories.new(calory_params)
    if @calory.save
      flash.now[:success] = 'The article was created succefull'
      redirect_to calories_path
    else
      flash.now[:alert] = 'OH NO!'
      redirect_to new_calory_path
    end
  end

  def edit
  end

  def show
  end

  def update
    if @calory.update(calory_params)
      redirect_to @calory
    else
      flash[:alert] = "Error"
      end
    end

    def destroy
      @calory.destroy
      flash[:success] = "Se elimino correctamente"
      redirect_to calories_path
    end


  private

  def set_calory
    @calory = Calory.find(params[:id])
  end

  def calory_params
    params.require(:calory).permit(:type_calory,:comment_calory,:date_calory,:cont_calories,:description_calory)
  end

end
