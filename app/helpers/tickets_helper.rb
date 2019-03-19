module TicketsHelper
  def normalize_ticket(ticket)
    ticket.each_key do |key|
      ticket[key] = ticket[key].join(', ')  if ticket[key].kind_of?(Array)
      ticket.delete(key)                    if ticket_fields.include?(key)
    end
  end

  private

  def ticket_fields
    %w[id well_known_text created_at updated_at]
  end
end
