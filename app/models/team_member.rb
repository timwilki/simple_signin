class TeamMember < ApplicationRecord
  belongs_to :organisation
  validates :organisation_id, presence: true
end
