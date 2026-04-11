module Api
  module V1
    class MessagesController < ApplicationController
      before_action :set_ticket
      before_action :require_owner_or_admin!

      def index
        messages = @ticket.messages.includes(:user).order(:created_at)
        render json: messages.map { |m| MessagePresenter.render(m) }
      end

      def create
        message = @ticket.messages.new(
          body: params.dig(:message, :body),
          user: current_user
        )

        if message.save
          render json: MessagePresenter.render(message), status: :created
        else
          render_unprocessable(message.errors.full_messages)
        end
      end

      private

      def set_ticket
        @ticket = Ticket.find(params[:ticket_id])
      end
    end
  end
end
