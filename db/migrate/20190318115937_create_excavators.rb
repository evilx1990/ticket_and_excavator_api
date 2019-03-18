# frozen_string_literal: true

class CreateExcavators < ActiveRecord::Migration[5.2]
  def change
    create_table :excavators do |t|
      t.string      :company_name,  defoult: ''   # Excavator->CompanyName
      t.json        :address,       default: {}   # Excavator->Address (full address including city, zip etc)
      t.boolean     :crew_onsite,   default: nil  # Excavator->CrewOnSite

      t.references  :ticket

      t.timestamps
    end

    add_index :excavators, :company_name
  end
end
