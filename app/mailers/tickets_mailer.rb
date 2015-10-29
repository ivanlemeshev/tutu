class TicketsMailer < ApplicationMailer
  def buy_ticket(user, ticket)
    @user = user
    @ticket = ticket
    # TODO: добавить локализцаию после мерджа 18го задачния
    mail(to: user.email, subject: 'Вы купили билет')
  end
end
