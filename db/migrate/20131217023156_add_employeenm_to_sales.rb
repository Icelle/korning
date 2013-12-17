class AddEmployeenmToSales < ActiveRecord::Migration
  def change
    add_column :sales, :employee_nm, :string
  end
end
