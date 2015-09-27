class RoutesController < ApplicationController
  def index
    @routes = Route.all
  end

  def show
    @route = Route.find(params[:id])
  end

  def new
    @route = Route.new
  end

  def edit
    @route = Route.find(params[:id])
  end

  def create
    @route = Route.new(route_params)
    if @route.save
      redirect_to @route
    else
      render 'new'
    end
  end

  def update
    @route = Route.find(params[:id])
    if @route.update(route_params)
      redirect_to @route
    else
      render 'edit'
    end
  end

  private

  def route_params
    params.require(:route).permit(:title)
  end
end
