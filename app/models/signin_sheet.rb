class SigninSheet < ApplicationRecord
  belongs_to :team_member
  default_scope -> { order(created_at: :desc) }

end
