# Part 2: Classes and Inheritance

# Q4. Create a base class Person with:
# Attributes: name , age
# Method: display()
# Create a derived class Employee :
# Additional attributes: employee_id , department
# Override display() to include all attributes
class Person:
    def __init__(self,name,age):
        self.name = name
        self.age = age
    def display(self):
        print(f"Name: {self.name} \nAge: {self.age}")

class Employee(Person):
    def __init__(self,name,age,employee_id,department):
        super().__init__(name,age)
        self.employee_id=employee_id
        self.department=department
    def display(self):
        super().display()
        print(f"Employee_ID: {self.employee_id} \nDepartment: {self.department}")

emp=Employee("Ram",21,"ECE015","ECE")
emp.display()




# Q5. Demonstrate method overriding with another example:
# Vehicle → Car
# drive() method with custom message in child
class Vehicle:
    def drive(self):
        print("This is a vehicle")

class Car(Vehicle):
    def drive(self):
        print("The vehicle is car")

obj=Car()
obj.drive()




