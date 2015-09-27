class RoutesController < ApplicationController
  def new
  end

  def create
    @route = Route.new(route_params)
    @route.save
    redirect_to @route
  end

  private

  def route_params
    params.require(:route).permit(:title)
  end
end
