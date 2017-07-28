class RemoveOutAtFromSigninSheets < ActiveRecord::Migration[5.0]
  def change
    remove_column :signin_sheets, :out_at, :datetime
  end
end
