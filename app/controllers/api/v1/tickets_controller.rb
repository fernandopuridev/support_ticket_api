module Api
  module V1
    class TicketsController < ApplicationController
      before_action :require_admin!, only: [:update]

      def index
        tickets = current_user.admin? ? Ticket.all : current_user.tickets
        render json: tickets.map { |t| TicketPresenter.render(t) }
      end

      def show
        ticket = Ticket.find(params[:id])
        require_owner_or_admin!(ticket)
        render json: TicketPresenter.render(ticket)
      end

      def create
        ticket = current_user.tickets.new(ticket_params)

        if ticket.save
          render json: TicketPresenter.render(ticket), status: :created
        else
          render json: { errors: ticket.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        ticket = Ticket.find(params[:id])

        if ticket.update(status: params.dig(:ticket, :status))
          render json: TicketPresenter.render(ticket)
        else
          render json: { errors: ticket.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def ticket_params
        params.require(:ticket).permit(:title, :description, :category)
      end
    end
  end
end
