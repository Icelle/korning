class Customer < ActiveRecord::Base
  belongs_to :employee
  has_one :account
  has_many :sales
end
