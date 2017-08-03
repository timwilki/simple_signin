class TeamMember < ApplicationRecord
  require 'csv'

  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  belongs_to :organisation
  validates :organisation_id, presence: true
  has_many  :signin_sheets


  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|

      team_member_hash = row.to_hash
      team_member = TeamMember.where(id: team_member_hash["id"])

      if team_member.count == 1
        team_member.first.update_attributes(team_member_hash)
      else
        team_member.create!(team_member_hash)
   end
 end
end

end
