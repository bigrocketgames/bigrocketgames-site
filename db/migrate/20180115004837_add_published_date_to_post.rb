class AddPublishedDateToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :publishedDate, :datetime
  end
end
