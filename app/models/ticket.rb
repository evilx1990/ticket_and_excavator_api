# frozen_string_literal: true

class Ticket < ApplicationRecord
  has_one :excavator

  def self.coord_to_a(polygons)
    polygons.scan(/-\d+\.\d+\s*\d+\.\d+\s*[^,)]/)
  end
end
