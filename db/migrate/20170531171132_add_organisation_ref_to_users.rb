class AddOrganisationRefToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :organisation, foreign_key: true
  end
end
