class Sale < ActiveRecord::Base
  belongs_to :product
  belongs_to :customer
  belongs_to :employee
  has_one   :invoice

  def price_per_unit
    if self.invoice.frequency == "Monthly"
      (sale_amount / 12).round(2)
    elsif self.invoice.frequency == "Quarterly"
      (sale_amount / 3).round(2)
    else
      sale_amount
    end
  end

end
