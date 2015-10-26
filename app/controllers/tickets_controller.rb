class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  before_action :set_train, only: [:new, :create]

  def index
    @tickets = Ticket.all
  end

  def show
  end

  def new
    @ticket = Ticket.new
  end

  def edit
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

  def update
    if @ticket.update(ticket_params)
      redirect_to @ticket, notice: 'Ticket was successfully updated.'
    else
      render 'edit'
    end
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_path, notice: 'Ticket was successfully destroyed.'
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
