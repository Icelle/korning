require 'spec_helper'

describe Scrub do
  it "should load all employees, customers" do
    Scrub.load
    expect(Employee.count).to eql(4)
    expect(Customer.count).to eql(6)
    expect(Product.count).to eql(4)
    expect(Invoice.count).to eql(996)
  end

  it "should scrub_employee" do
    expect(Scrub.scrub_employee("Clancy Wiggum (clancy.wiggum@korning.com)")).to eql({:first_name=>"Clancy", :last_name=>"Wiggum", :email=>"clancy.wiggum@korning.com"})
  end

  it "should scrub_customer" do
    expect(Scrub.scrub_customer("Motorola (MT928534")).to eql({:name => "Motorola", :website=>"http://motorola.com/", :account_number=>"MT928534"})
  end
end
