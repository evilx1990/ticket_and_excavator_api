# frozen_string_literal: true

class TicketsController < ApplicationController # :nodoc:
  def index
    @tickets = Ticket.all
  end

  def show
    @ticket = Ticket.find_by(request_number: params[:id])
  end
end
