require "employee"

class Startup
  attr_reader :name, :funding, :salaries, :employees

  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
  end  

  def valid_title?(title)
    @salaries.key?(title)
  end  

  def >(other_startup)
    self.funding > other_startup.funding
  end  

  def hire(name, title)
    if self.valid_title?(title)
      @employees << Employee.new(name, title)
    else
      raise "title is invalid"  
    end  
  end  

  def size
    @employees.length
  end  

  def pay_employee(employee)
    employee_salary = @salaries[employee.title]

    if self.funding >= employee_salary
      employee.pay(employee_salary)
      @funding -= employee_salary
    else
      raise "the startup does not have enough funding"
    end  
  end  

  def payday
    @employees.each {|employee| self.pay_employee(employee)}
  end  
end
