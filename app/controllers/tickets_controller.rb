class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket, only: [:show, :destroy]
  before_action :set_train, only: [:new, :create]

  def index
    @tickets = current_user.tickets
  end

  def show
    redirect_to tickets_path, alert: I18n.t('alerts.access_denied') unless current_user.owner_of?(@ticket)
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = current_user.tickets.new(ticket_params)
    @ticket.train = @train
    if @ticket.save
      redirect_to @ticket, notice: I18n.t('notices.ticket_purchased')
    else
      render 'new'
    end
  end

  def destroy
    if current_user.owner_of?(@ticket)
      @ticket.destroy
      redirect_to tickets_path, notice: I18n.t('notices.ticket_destroyed')
    else
      redirect_to tickets_path, alert: I18n.t('alerts.access_denied')
    end
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def set_train
    @train = Train.find(params[:train_id])
  end

  def ticket_params
    params.require(:ticket).permit(:first_name, :middle_name, :last_name, :train_id, :passport_series, :passport_number)
  end
end
