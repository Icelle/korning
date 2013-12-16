class Customer < ActiveRecord::Base
  belongs_to :employee
  has_many :sales
end
