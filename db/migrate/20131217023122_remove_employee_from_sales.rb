class RemoveEmployeeFromSales < ActiveRecord::Migration
  def change
    remove_column :sales, :employee
  end
end
