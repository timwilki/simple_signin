class CreateSigninSheets < ActiveRecord::Migration[5.0]
  def change
    create_table :signin_sheets do |t|
      t.boolean :signedin, default: true
      t.datetime :out_at
      t.references :team_member, foreign_key: true

      t.timestamps
    end
      add_index :signin_sheets, [:team_member_id, :created_at]
  end
end
