class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket, only: [:show, :destroy]
  before_action :set_train, only: [:new, :create]

  def index
    @tickets = Ticket.where(user_id: current_user.id).all
  end

  def show
    redirect_to tickets_path, alert: 'You have no access to this page.' unless ticket_owner?
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = @train.tickets.new(ticket_params)
    current_user.tickets << @ticket
    if @ticket.save
      redirect_to @ticket, notice: 'Ticket was successfully purchased.'
    else
      render 'new'
    end
  end

  def destroy
    if ticket_owner?
      @ticket.destroy
      redirect_to tickets_path, notice: 'Ticket was successfully destroyed.'
    else
      redirect_to tickets_path, alert: 'You have no access to this page.'
    end
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def set_train
    @train = Train.find(params[:train_id])
  end

  def ticket_owner?
    @ticket.user_id == current_user.id
  end

  def ticket_params
    params.require(:ticket).permit(:first_name, :middle_name, :last_name, :train_id, :passport_series, :passport_number)
  end
end
