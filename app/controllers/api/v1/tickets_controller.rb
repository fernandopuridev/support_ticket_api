module Api
  module V1
    class TicketsController < ApplicationController
      before_action :set_ticket, only: [:show, :update]
      before_action :require_owner_or_admin!, only: [:show]
      before_action :require_admin!, only: [:update]

      def index
        tickets = current_user.admin? ? Ticket.all : current_user.tickets
        render json: tickets.map { |t| TicketPresenter.render(t) }
      end

      def show
        render json: TicketPresenter.render(@ticket)
      end

      def create
        ticket = current_user.tickets.new(ticket_params)

        if ticket.save
          render json: TicketPresenter.render(ticket), status: :created
        else
          render_unprocessable(ticket.errors.full_messages)
        end
      end

      def update
        if @ticket.update(status: params.dig(:ticket, :status))
          render json: TicketPresenter.render(@ticket)
        else
          render_unprocessable(@ticket.errors.full_messages)
        end
      end

      private

      def set_ticket
        @ticket = Ticket.find(params[:id])
      end

      def ticket_params
        params.require(:ticket).permit(:title, :description, :category)
      end
    end
  end
end
