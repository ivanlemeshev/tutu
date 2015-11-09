class Admin::RoutesController < Admin::BaseController
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
      redirect_to [:admin, @route], notice: I18n.t('notices.route_created')
    else
      render 'new'
    end
  end

  def update
    if @route.update(route_params)
      redirect_to admin_routes_path, notice: I18n.t('notices.route_updated')
    else
      render 'edit'
    end
  end

  def destroy
    @route.destroy
    redirect_to admin_routes_path, notice: I18n.t('notices.route_destroyed')
  end

  private

  def set_route
    @route = Route.find(params[:id])
  end

  def route_params
    params.require(:route).permit(:title, railway_station_ids: [])
  end
end
