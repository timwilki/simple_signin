class AddShiftLegnthToSigninSheets < ActiveRecord::Migration[5.0]
  def change
    add_column :signin_sheets, :shift_legnth, :integer
  end
end
