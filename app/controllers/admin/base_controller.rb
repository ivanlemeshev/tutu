class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  layout 'admin'

  protected

  def check_admin
    redirect_to root_path, alert: I18n.t('alerts.access_denied') unless current_user.admin?
  end
end
