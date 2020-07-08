class Employee
    attr_reader :salary, :name, :title, :boss

    def initialize(name, title, salary, boss=nil)
        @name = name 
        @title = title 
        @salary = salary 
        @boss = boss
    end

    def bonus(multiplier)
        @salary * multiplier
    end 

    def boss=(boss)
        @boss = boss
        boss.add_employee(self)
    end 

end

#overwrite boss= 
#call add employee and adds self employee to them array 




class Manager < Employee 

    attr_reader :employees
    
    def initialize(name, title, salary, boss=nil)
        @employees = [] 
        super
    end 

    def add_employee(employee)
        @employees << employee
    end 
    #make add employee method

    def total_salary 
        total_salaries = 0
        
        @employees.each do |employee|
            if employee.is_a?(Manager)
                total_salaries += employee.salary
                total_salaries += employee.total_salary
            else  
                total_salaries += employee.salary
            end
        end  
    
        return total_salaries  
    end 

    def bonus(multiplier)
        self.total_salary * multiplier 
    end 

end 