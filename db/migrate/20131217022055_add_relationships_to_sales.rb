class AddRelationshipsToSales < ActiveRecord::Migration
  def change
    add_reference :sales, :product, index: true
    add_reference :sales, :customer, index: true
    add_reference :sales, :employee, index: true
  end
end
