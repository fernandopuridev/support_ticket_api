module Api
  module V1
    class MessagesController < ApplicationController
      def index
        ticket = Ticket.find(params[:ticket_id])
        require_owner_or_admin!(ticket)
        messages = ticket.messages.includes(:user).order(:created_at)
        render json: messages.map { |m| MessagePresenter.render(m) }
      end

      def create
        ticket = Ticket.find(params[:ticket_id])
        require_owner_or_admin!(ticket)
        message = ticket.messages.new(
          body: params.dig(:message, :body),
          user: current_user
        )

        if message.save
          render json: MessagePresenter.render(message), status: :created
        else
          render json: { errors: message.errors.full_messages }, status: :unprocessable_entity
        end
      end
    end
  end
end
