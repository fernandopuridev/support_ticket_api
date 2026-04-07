class MessagePresenter
  def self.render(message)
    {
      id: message.id,
      body: message.body,
      created_at: message.created_at,
      user: {
        id: message.user.id,
        name: message.user.name,
        role: message.user.role
      }
    }
  end
end
