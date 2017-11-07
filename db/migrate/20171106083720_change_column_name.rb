class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :signin_sheets, :shift_legnth, :shift_length
  end
end
