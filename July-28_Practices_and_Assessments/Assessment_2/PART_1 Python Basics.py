# Part 1: Python Basics

# Q1. Write a Python function factorial(n) using a loop.
# Don’t use math.factorial().
def factorial(n):
    result=1
    for i in range(1,n+1):
        result *= i
    return result

n=int(input("Enter the number to find its Factorial: "))
res=factorial(n)
print(f"The factorial of {n} is: ",res)




# Q2. Create a list of tuples like this:
# [("Aarav", 80), ("Sanya", 65), ("Meera", 92), ("Rohan", 55)] Write code to:
# Print only names of students scoring above 75
# Calculate and print average score
students = [("Aarav", 80), ("Sanya", 65), ("Meera", 92), ("Rohan", 55)]
print("\nStudents scoring above 75:")
for name,score in students:
    if score > 75:
        print(name)

total=0
for student in students:
    total += student[1]

avg=total / len(students)
print("\nAverage Score: ",avg)

