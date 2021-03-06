class CaloriesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_calory, only: %i[ show edit update destroy ]


  def index
    unless current_user.nil?

      if params[:keyword] && params[:keyword2].present?
          palabra = "%#{params[:keyword]}%"
          palabra2 = "%#{params[:keyword2]}%"
          word = Date.parse(palabra)
          word2 = Date.parse(palabra2)
          @calories = Calory.paginate(page: params[:page]).where('date_calory BETWEEN ? AND ?', word, word2).where(user_id: current_user.id)
      else
        palabra2 = "%#{params[:keyword3]}%"
        @calories = Calory.paginate(page: params[:page]).where('description_calory LIKE ? ',  palabra2).where(user_id: current_user.id).all
      end
    end
  end

  def chart
    unless current_user.nil?
      @calories = Calory.all.order(date_calory: :desc)
      @chart_data = Calory.types.keys.map do |type|
        { name: type.capitalize, data: current_user.calories.where(type: type).where(['date_calory >= (?)',Date.today]).where(['date_calory <= (?)',(Date.today + 30)]).group_by_day(:date_calory).sum(:cont_calories)}
      end
    end
  end

  def new
    @calory = Calory.new
  end

  def create
    @calory = current_user.calories.new(calory_params)
    if @calory.save
      @user = current_user.update_visits_count
      flash[:notice] = 'The calory was created succefull'
      redirect_to calories_path
    else
      flash[:notice] = 'OH NO!'
      redirect_to new_calory_path
    end
  end

  def edit
  end

  def show
  end

  def update
    if @calory.update(calory_params)
      flash[:success] = "The calory was update correctly"
      redirect_to @calory
    else
      flash[:alert] = "Error"
      end
    end

    def destroy
      @calory.destroy
      @user = current_user.update_visits_count_delete
      flash[:success] = "The calory was delete correctly"
      redirect_to calories_path
    end


  private

  def set_calory
    @calory = Calory.find(params[:id])
  end

  def calory_params
    params.require(:calory).permit(:type ,:comment_calory,:date_calory,:cont_calories,:description_calory)
  end

end
