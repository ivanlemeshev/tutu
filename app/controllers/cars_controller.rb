class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]
  before_action :set_train, only: [:new, :create]

  def show
  end

  def new
    @car = Car.new
  end

  def edit
  end

  def create
    @car = @train.cars.build(car_params)

    if @car.save
      redirect_to @train, notice: 'Car was successfully created.'
    else
      render 'new'
    end
  end

  def update
    if @car.update(car_params)
      redirect_to @car.train, notice: 'Car was successfully updated.'
    else
      render 'edit'
    end
  end

  def destroy
    @car.destroy
    redirect_to @car.train, notice: 'Car was successfully destroyed.'
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def set_train
    @train = Train.find(params[:train_id])
  end

  def car_params
    params.require(:car).permit(:type, :top_seats, :bottom_seats, :side_top_seats, :side_bottom_seats, :train_id)
  end
end
