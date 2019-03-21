# frozen_string_literal: true

module TicketsHelper
  def normalize_ticket(ticket)
    ticket.each_key do |key|
      ticket[key] = ticket[key].join(', ')        if ticket[key].kind_of?(Array)
      ticket[key] = ticket[key].strftime('%v %T') if ticket[key].kind_of?(ActiveSupport::TimeWithZone)
      ticket.delete(key)                          if ticket_fields.include?(key)
    end
  end

  # excavator address
  def normalize_address(address)
    address.delete('address')
    address
  end

  private

  def ticket_fields
    %w[id well_known_text created_at updated_at]
  end
end
