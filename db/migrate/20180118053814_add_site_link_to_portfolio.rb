class AddSiteLinkToPortfolio < ActiveRecord::Migration[5.1]
  def change
    add_column :portfolios, :siteLink, :string
  end
end
