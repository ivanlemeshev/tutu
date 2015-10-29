class TicketsMailer < ApplicationMailer
  def buy_ticket(user, ticket)
    @user = user
    @ticket = ticket
    mail(to: user.email, subject: t('mailers.tickets.buy_ticket.subject'))
  end

  def cancel_ticket(user, ticket)
    @user = user
    @ticket = ticket
    mail(to: user.email, subject: t('mailers.tickets.cancel_ticket.subject'))
  end
end
