class Organisation < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :team_members, dependent: :destroy
  has_many :signin_sheets, through: :team_members
  validates :name, presence: true


end
