class ChangeDefaultStatusToPost < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:posts, :status, 0)
  end
end
