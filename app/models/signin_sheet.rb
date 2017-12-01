class SigninSheet < ApplicationRecord
  belongs_to :team_member
  default_scope -> { order(created_at: :desc) }

  def self.to_csv
    attributes = %w{id created_at shift_length}
    CSV.generate( headers: true) do |csv|
      csv << attributes

      all.each do |shifts|
        csv << shifts.attributes.values_at(*attributes)
      end
    end
  end


end
