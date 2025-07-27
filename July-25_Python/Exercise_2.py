# Simplified Intermediate Python Exercises (All Topics Included)
# 1. BMI Calculator (Input + Function + Conditions + math )

# What to do:
# Ask user to enter weight (kg) and height (m)
# Create a function to calculate BMI = weight / height²
# Print if the user is Underweight, Normal, or Overweight
# Use: math.pow(height, 2) or height * height
import math
weight=float(input("Enter your weight in kg (Example:50.0):  "))
height=float(input("Enter your height in m (Example:1.57):  "))

def bmi(w,h):
    result = w/(math.pow(h,2))
    return result

calculated_bmi=bmi(weight,height)

if calculated_bmi < 18.5:
    print(f"{calculated_bmi} - UNDER WEIGHT")
elif calculated_bmi >= 18.5 and calculated_bmi <= 24.9:
    print(f"{calculated_bmi} - NORMAL")
else:
    print(f"{calculated_bmi} - OVER WEIGHT")




# 2. Strong Password Checker (Strings + Conditions + Loop)

# What to do:
# Ask the user to enter a password
# Check if it:
# Has at least 1 capital letter
# Has at least 1 number
# Has at least 1 special character like !@#$
# If not, ask again until the password is strong.
def is_strong(password):
    has_upper=False
    has_digit=False
    has_special_characters=False

    for i in password:
        ascii_value=ord(i)   #converting string into integer

        if 65 <= ascii_value <= 90:
            has_upper=True
        elif 48 <= ascii_value <= 57:
            has_digit=True
        elif 33 <= ascii_value <= 126:
            has_special_characters=True

    if has_upper and has_digit and has_special_characters:
        return True
    else:
        return False

while True:
    password=input("Enter Your Password: ")

    if is_strong(password):
        print("Your Password is very Strong..")
        break

    else:
        print("Weak Password. It must contain at least: ")
        print("- One uppercase letter")
        print("- One number")
        print("- One special character")
        print("Please try again.\n")




# 3. Weekly Expense Calculator (List + Loop + Built-in Functions)

# What to do:
# Ask the user to enter 7 numbers (daily expenses)
# Store them in a list
# Create a function to:
# Show total spent
# Show average per day
# Show highest spend in a day
# Use: sum() , max() , len()
def weekly_expense_calculator(expenses_list):
    total_spent=sum(expenses_list)
    average_per_day=total_spent / (len(expenses_list))
    highest_spend_in_a_day=max(expenses_list)
    return total_spent, average_per_day, highest_spend_in_a_day

days=["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
expenses_list=[]
print("---Enter your day by day expenses---")
for day in days:
    expense=int(input(f"Enter the Expense for {day}:₹"))
    expenses_list.append(expense)

total_spent, average_per_day, highest_spend_in_a_day= weekly_expense_calculator(expenses_list)
print(f"Your Total spent is: ₹{total_spent}")
print(f"Your Average per Day: ₹{average_per_day}")
print(f"Highest spend in a day: ₹{highest_spend_in_a_day}")




# 4. Guess the Number (Loops + random )

# What to do:
# Use random.randint(1, 50) to pick a secret number
# Ask the user to guess
# Tell them if their guess is Too High, Too Low, or Correct
# Give only 5 chances
import random
print("---Guess the Random Number---")
print("You have 5 chances to guess the number between 1 to 50")
random_number=random.randint(1,50)

chance=5

while(chance>=1):
    print(f"Your chances: {chance}")
    guessing_number = int(input("Enter your guessing number: "))
    if guessing_number < random_number:
        print("Your guess is TOO LOW")
    elif guessing_number > random_number:
        print("Your guess is TOO HIGH")
    else:
        print("Your guess is CORRECT")
        break
    chance -= 1

    if chance==0:
        print(f"Game Over! The correct number is: {random_number}")




# 5. Student Report Card (Functions + Input + If/Else + datetime )

# What to do:
# Ask name and 3 subject marks
# Create functions to:
# Calculate total and average
# Print grade: A, B, or C
# Show current date using datetime.date.today()
import datetime
def total_marks(marks_list):
    total = 0
    for i in marks_list:
        total = total + i
    print(f"Your Total Score is: {total}")
    return total

def average(total):
    avg = total / len(subjects)
    if 85 <= avg <= 100:
        print(f"Your Average = {avg} - GRADE A")
    elif 65 <= avg <= 84:
        print(f"Your Average = {avg} - GRADE B")
    else:
        print(f"Your Average = {avg} - GRADE C")

print("---Student Report Card---")
stud_name=input("Enter Your Name: ")
subjects=["subject_1","subject_2","subject_3"]

marks_list=[]

for subject in subjects:
    mark=int(input(f"Enter your marks for {subject}: "))
    marks_list.append(mark)

average(total_marks(marks_list))
print("Current Date: ",datetime.date.today())




# 6. Contact Saver (Loop + Dictionary + File Writing)

# What to do:
# Show a menu:
# 1. Add Contact
# 2. View Contacts
# 3. Save & Exit
# Save contacts (name, phone) in a dictionary
# When exiting, write them into a file called contacts.txt line by line
# Use: open() , for loop, dictionary
print("---Contact Saver---")

contacts={}

while True:
    print("1. Add Contact")
    print("2. View Contacts")
    print("3. Save and Exit")

    choice=input("Enter your choice (1/2/3): ")

    if choice=="1":
        name=input("Enter Contact Name: ")
        phone=input("Enter contact Number: ")
        contacts[name]=phone
        print(f"Contact '{name}' added successfully")

    elif choice=="2":
        if not contacts:
            print("No Contacts Found")
        else:
            print("---Saved Contacts---")
            for name, phone in contacts.items():
                print(f"{name} : {phone}")

    elif choice=="3":
        with open("Contacts.txt",'w') as file:
            for name, phone in contacts.items():
                file.write(f"{name} : {phone}\n")
        print("Contacts saved to 'Contacts.txt'. Exiting....")
        break

    else:
        print("Invalid Choice. Please enter 1 or 2 or 3")









