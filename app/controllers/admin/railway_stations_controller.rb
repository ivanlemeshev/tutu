class Admin::RailwayStationsController < Admin::BaseController
  include ApplicationHelper

  before_action :set_railway_station, only: [:show, :edit, :update, :destroy, :update_params]

  def index
    @railway_stations = RailwayStation.all
  end

  def show
  end

  def new
    @railway_station = RailwayStation.new
  end

  def edit
  end

  def create
    @railway_station = RailwayStation.new(railway_station_params)

    if @railway_station.save
      redirect_to [:admin, @railway_station], notice: 'Railway station was successfully created.'
    else
      render 'new'
    end
  end

  def update
    if @railway_station.update(railway_station_params)
      redirect_to [:admin, @railway_station], notice: 'Railway station was successfully updated.'
    else
      render 'edit'
    end
  end

  def destroy
    @railway_station.destroy
    redirect_to admin_railway_stations_path, notice: 'Railway station was successfully destroyed.'
  end

  def update_params
    @route = Route.find(params[:route_id])
    @railway_station.update_params(@route, {
      position: params[:position],
      departure_time: date_hash_to_datetime(params[:departure_time]),
      arrival_time: date_hash_to_datetime(params[:arrival_time])
    })
    redirect_to [:admin, @route], notice: 'Order updated.'
  end

  private

  def set_railway_station
    @railway_station = RailwayStation.find(params[:id])
  end

  def railway_station_params
    params.require(:railway_station).permit(:title)
  end
end
