class AddWebsiteToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :website, :string
  end
end
