class AddSourceCodeLinkToPortfolio < ActiveRecord::Migration[5.1]
  def change
    add_column :portfolios, :sourceCodeLink, :string
  end
end
