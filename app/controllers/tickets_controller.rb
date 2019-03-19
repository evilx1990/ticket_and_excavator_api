# frozen_string_literal: true

class TicketsController < ApplicationController # :nodoc:
  def index
    @tickets = Ticket.all
  end

  def show
    @ticket = Ticket.find(params[:id])
  end
end
