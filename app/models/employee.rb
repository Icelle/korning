class Employee < ActiveRecord::Base
  has_many :customers
  has_many :sales
end
