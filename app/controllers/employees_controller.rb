class EmployeesController < ApplicationController

  def index
    @employees = Employee.all
  end

  def show
    @employee = Employee.find(params[:id])
    @sales = @employee.sales.order(sale_amount: :desc)
  end

end
