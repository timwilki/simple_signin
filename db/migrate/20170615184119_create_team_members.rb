class CreateTeamMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :team_members do |t|
      t.string :first_name
      t.string :last_name
      t.references :organisation, foreign_key: true

      t.timestamps
    end
    add_index :team_members, [:organisation_id, :created_at]
  end
end
