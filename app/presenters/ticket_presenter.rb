class TicketPresenter
  def self.render(ticket)
    {
      id: ticket.id,
      title: ticket.title,
      description: ticket.description,
      category: ticket.category,
      status: ticket.status,
      created_at: ticket.created_at,
      user: {
        id: ticket.user.id,
        name: ticket.user.name
      }
    }
  end
end
