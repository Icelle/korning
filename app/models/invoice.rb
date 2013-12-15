class Invoice < ActiveRecord::Base
  belongs_to :sale
end
