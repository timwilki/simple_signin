class AddIndexToTeamMembersEmail < ActiveRecord::Migration[5.0]
  def change
      add_index :team_members, :email, unique: true
  end
end
