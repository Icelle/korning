class Scrub
  # load all ActiveRecord model relationships and data
  def self.load
    sales = Sale.all
    sales.each do |sale|
      employee = create_employee(sale.employee)
      customer = create_customer(employee, sale.customer_and_account_no)
      # create_account(sale.customer_and_account_no)
    end
  end

  # @return [Employee] instance of existing employee or newly created employee
  def self.create_employee(employee_string)
    employee = scrub_employee(employee_string)
    # assume employee email is unique
    # if no match is found, create employee
    existing_employee = Employee.find_by_email(employee[:email])
    if existing_employee.nil?
      return Employee.create(employee)
    end
    return existing_employee
  end

  # @param [String] employee - string from sale
  # @return [Hash] hash to create employee
  def self.scrub_employee(employee_string)
    employee = {}
    values = employee_string.split
    employee[:first_name] = values[0]
    employee[:last_name] = values[1]
    employee[:email] = values[2].gsub(/[()]/,"")
    return employee
  end

  # @param [Employee] employee - employee associated with customer
  # @return [Customer] instance of existing or newly created customer
  def self.create_customer(employee, customer_string)
    customer = scrub_customer(customer_string)
    customer[:employee] = employee
    existing_customer = Customer.find_by_name(customer[:name])
    if existing_customer.nil?
      return Customer.create(customer)
    end
    return existing_customer
  end

  # @param [String] customer_string - customer string to scrub
  # @return [Hash] customer hash
  def self.scrub_customer(customer_string)
    customer = {}
    values = customer_string.split
    customer[:name] = values[0]
    customer[:website] = "http://"+customer[:name].downcase+".com/"
    customer[:account_number] = values[1].gsub(/[()]/,"")
    return customer
  end

end
