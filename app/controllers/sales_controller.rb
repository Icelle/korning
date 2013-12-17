class SalesController < ApplicationController
  def index
    @sales = Sale.where(:sale_date => 13.months.ago..Time.now)
    # Sale.where('sale_date >= ?', 13.months.ago)
  end
end
