# frozen_string_literal: true

class TicketsController < ApplicationController # :nodoc:
  def index
    @tickets = Ticket.all
  end

  def show
    @ticket = Ticket.find_by(request_number: params[:id])
  end

  def create
    request.format = :json
    @ticket = Ticket.new(ticket_params)

    if @ticket.save && @ticket.create_excavator(excavator_params)
      render json: { message: 'Successfully saved' }, status: :ok
    else
      render json: { message_s: @ticket.errors.full_messages }, status: :bad_request
    end
  end

  private

  def ticket_params
    params.permit(:request_number, :sequence_number, :request_type).tap do |whitelisted|
      whitelisted[:response_due_date_time] = params[:date_times][:response_due_date_time]
      whitelisted[:primary_service_area_sa_code] = params[:service_area][:primary_service_area_code][:sa_code]
      whitelisted[:additional_service_area_sa_code] = params[:service_area][:additional_service_area_codes][:sa_code]
      whitelisted[:well_known_text] = params[:excavation_info][:digsite_info][:well_known_text]
    end
  end

  def excavator_params
    params.permit.tap do |whitelisted|
      whitelisted[:address] = {
        address: params[:excavator][:address],
        city: params[:excavator][:city],
        state: params[:excavator][:state],
        zip: params[:excavator][:zip]
      }
      whitelisted[:company_name] = params[:excavator][:company_name]
      whitelisted[:crew_onsite] = params[:excavator][:crew_onsite]
    end
  end
end
