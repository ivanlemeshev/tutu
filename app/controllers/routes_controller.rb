class RoutesController < ApplicationController
  before_action :set_route, only: [:show, :edit, :update, :destroy]

  def index
    @routes = Route.all
  end

  def show
  end

  def new
    @route = Route.new
  end

  def edit
    associated_ids = RouteStation.where(route_id: @route.id).select(:railway_station_id)
    @railway_stations = RailwayStation.where.not(id: associated_ids)
  end

  def create
    @route = Route.new(route_params)

    if @route.save
      redirect_to @route, notice: 'Route was successfully created.'
    else
      render 'new'
    end
  end

  def update
    if @route.update(route_params)
      redirect_to @route, notice: 'Route was successfully updated.'
    else
      render 'edit'
    end
  end

  def destroy
    @route.destroy
    redirect_to routes_path, notice: 'Route was successfully destroyed.'
  end

  private

  def set_route
    @route = Route.find(params[:id])
  end

  def route_params
    params.require(:route).permit(:title, railway_station_ids: [])
  end
end
