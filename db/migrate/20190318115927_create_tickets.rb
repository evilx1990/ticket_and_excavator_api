# frozen_string_literal: true

class CreateTickets < ActiveRecord::Migration[5.2] # :nodoc:
  def change
    create_table :tickets do |t|
      t.string    :request_number,                  default: ''
      t.integer   :sequence_number,                 default: 0
      t.string    :request_type,                    default: ''
      # DateTimes->ResponseDueDateTime
      t.datetime  :response_due_date_time,          default: -> { 'CURRENT_TIMESTAMP' }
      # ServiceArea->PrimaryServiceAreaCode->SACode,
      t.string    :primary_service_area_sa_code,    default: ''
      # ServiceArea->AdditionalServiceAreaCodes->SACode
      t.string    :additional_service_area_sa_code, default: [], array: true
      # DigsiteInfo->WellKnownText (can be saved as plain text)
      t.string    :well_known_text,                 default: ''

      t.timestamps
    end

    add_index :tickets, :request_number
  end
end
