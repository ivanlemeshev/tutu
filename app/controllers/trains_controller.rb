class TrainsController < ApplicationController
  before_action :set_train, only: [:show, :edit, :update, :destroy]

  def index
    @trains = Train.all
  end

  def show
  end

  def new
    @train = Train.new
  end

  def edit
  end

  def create
    @train = Train.new(train_params)

    if @train.save
      redirect_to @train, notice: 'Train was successfully created.'
    else
      render 'new'
    end
  end

  def update
    if @train.update(train_params)
      redirect_to @train, notice: 'Train was successfully updated.'
    else
      render 'edit'
    end
  end

  def destroy
    @train.destroy
    redirect_to trains_path, notice: 'Train was successfully destroyed.'
  end

  private

  def set_train
    @train = Train.find(params[:id])
  end

  def train_params
    params.require(:train).permit(:number, :route_id, :cars_order)
  end
end
