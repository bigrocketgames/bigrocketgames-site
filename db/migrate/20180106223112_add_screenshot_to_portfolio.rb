class AddScreenshotToPortfolio < ActiveRecord::Migration[5.1]
  def change
    add_column :portfolios, :screenshot, :string
  end
end
