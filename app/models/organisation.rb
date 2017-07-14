class Organisation < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :team_members, dependent: :destroy
  validates :name, presence: true


end
