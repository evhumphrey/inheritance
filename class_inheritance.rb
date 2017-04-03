class Employee
  attr_reader :name, :title, :salary, :boss

  def initialize(name, salary, title, boss = nil)
    @salary = salary
    @name = name
    @boss = boss
    @title = title
  end

  def bonus(mulitplier)
    @salary * mulitplier
  end



end


class Manager < Employee

  attr_reader :employees

  def initialize(name, salary, title, boss = nil)
    super(name, salary, title, boss = nil)
    @employees = []
  end

  def add_employee(list)
    list.each do |i|
      @employees << i
    end
  end

  def bonus(mulitplier)
    total = 0
    employees.each do |employee|
      total += employee.salary
    end
    total * mulitplier
  end

end

ned = Manager.new("Ned", 1_000_000, "Founder")
darren = Manager.new("Darren", 78_000, "TA Manager", ned)
shawna = Employee.new("Shawna", 12_000, "TA", darren)
david = Employee.new("David", 10_000, "TA", darren)

ned.add_employee([darren, shawna, david])
darren.add_employee([shawna, david])

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
