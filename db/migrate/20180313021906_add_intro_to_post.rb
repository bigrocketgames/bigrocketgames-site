class AddIntroToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :intro, :text
  end
end
