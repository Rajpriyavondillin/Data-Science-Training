print("Hello World")

# Ask the user for their name
name=input("What's your name?")

# Greet the user
print("Hello, " + name+ "!")
print(f"Hello, {name}!")  # This is more popular than the above one

# Declaring a String
greetings="Hello, Umar"

# Assessing characters
print(greetings[0])  #H
print(greetings[-1])  #r

# Slicing
print(greetings[0:5])  #Hello
print(greetings[7:])  #Umar

# String Methods
print(greetings.upper())  #HELLO, UMAR
print(greetings.lower())  #hello, umar
print(greetings.replace("Umar","Captain"))  #Hello, Captain



# Declaring a list
fruits=["apple","banana","cherry"]

# Accessing elements
print(fruits[1])  #banana

# Adding elements
fruits.append("orange")
print(fruits)  #['apple', 'banana', 'cherry', 'orange']

# Removing elements
fruits.remove("banana")
print(fruits)  #['apple', 'cherry', 'orange']

# Slicing
print(fruits[1:])  #['cherry', 'orange']

# Looping
for fruit in fruits:
     print(fruit)         #apple
                          #cherry
                          #orange


# TUPLES - Immutable data structures
# Declaring a tuple
colours=("red","green","blue")

# Accessing elements
print(colours[0])   #red

# Slicing
print(colours[1:3])  #('green', 'blue') -  last value n-1 ie., 3-1=2=blue

# Tuple is Immutable(We can't modify it)
colours[0]="yellow"    #This Throws an error
# #TypeError: 'tuple' object does not support item assignment



# QUICK PRACTICE TASKS:
# 1. Create a string variable movie="The Lion King"
movie_name="The Lion King"
# print only "Lion" using slicing.
print(movie_name[4:8])  #Lion

# 2. Make a list of your 4 favorite foods.
fav_foods = ["Noodles","Pasta","Parotta","Chappathi"]
#  Add one more.
fav_foods.append("Dosa")
#  Remove the 2nd item.
fav_foods.remove("Parotta")
#  Print the final list.
print(fav_foods)  #['Noodles', 'Pasta', 'Chappathi', 'Dosa']

# 3. Create a tuple of 3 numbers.
numbers_tuple=(1,2,3)
#  Try accessing the last number.
print(numbers_tuple[2])  #3


# Conditional operations
age=int(input("Enter your age: "))
if age>=18:
    print("You can vote!")
else:
    print("You are too young to vote.")
# Example output:
# Enter your age: 22
# You can vote!

marks=int(input("Enter your Marks: "))
if marks >= 90:
    print("Grade A")
elif marks >= 75:
    print("Grade B")
elif marks >= 50:
    print("Grade C")
else:
    print("Grade F")
# Example output:
# Enter your Marks: 90
# Grade A


# LOOPING/ ITERATION
count=1
while count <= 5:
    print("Count is: ",count)
    count += 1
# Count is:  1
# Count is:  2
# Count is:  3
# Count is:  4
# Count is:  5

for i in range(5): # 0 to 4
    print("Number: ",i)
# Number:  0
# Number:  1
# Number:  2
# Number:  3
# Number:  4

for i in range(1,6): # 1 to 5
    print(i)
# 1
# 2
# 3
# 4
# 5

for i in range(1,10):
    if i==5:  # skips 5 alone
        continue
    if i==8: # stops at 8 - terminates the loop
        break
    print(i)
# 1
# 2
# 3
# 4
# 6
# 7


# FUNCTIONS
# User-defined Functions
def greet():
    print("Hello from Hexaware!")  # Hello from Hexaware!
greet() # Calling the function to view the output

def greet_user(name):
    print(f"Hello, {name}! Welcome.")
greet_user("Umar")  # Hello, Umar! Welcome.

def add(a,b):
    return a+b
result=add(10,5)
print("Sum is: ",result)  # Sum is:  15

def power(base,exponent=2):
    return base ** exponent
print(power(5))  # 25
print(power(5,3))  # 125

# In-Built Functions
name="Umar"
print(len(name))  #4

print(type(5))  #<class 'int'>
print(type("Hello"))   #<class 'str'>

age="12"
print(int(age) + 5)  #17

name=input("Enter Name: ")
print("Hellow",name)

nums=[5,9,3]
print(sum(nums))  #17
print(max(nums))  #9
print(min(nums))  #3

names=["Zara","Amin","Lina"]
print(sorted(names))  #['Amin', 'Lina', 'Zara']

print(abs(-9))  #9

print(round(3.75))  #4
print(round(3.25))  #3
print(round(3.7567,2))  #3.76


# MODULES -Collection of functions
import math
print(math.sqrt(16))  #4.0
print(math.pow(2,3))  #8.0
print(math.pi)  #3.141592653589793

import datetime as d    # we can give any alise name
today=d.date.today()
print("Today's date is: ",today)  #Today's date is:  2025-07-25
now=d.datetime.now()
print("Current time is: ",now.strftime("%H:%M:%S"))  #Current time is:  15:06:14


#main.py for mymath.py
import mymath as m
print("Addition: ",m.add(5,5))  #Addition:  10
print("Multiplication: ",m.multiply(10,10))  #Multiplication:  100
print("Subtraction: ",m.subtract(10,5))  #Subtraction:  5
print("Division: ",m.divide(35,5))  #Division:  7.0



# A MODULE IS A COLLECTION OF FUNCTIONS
# A PACKAGE IS A COLLECTION OF MODULES
from mypackage.calculator import add, subtract
from mypackage.string_utils import shout, whisper
print(whisper("She is a Bad girl"))    #she is a bad girl...
print(shout("Close the door"))    #CLOSE THE DOOR!!!
print(add(5,10))    #15
print(subtract(10,5))   #5





