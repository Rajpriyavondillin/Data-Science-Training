# 1. FizzBuzz Challenge
# Print numbers from 1 to 50:
# If divisible by 3, print "Fizz"
# If divisible by 5, print "Buzz"
# If divisible by both, print "FizzBuzz"
# Else, print the number
for number in range(1,51):
    if number%3==0 and number%5==0:
        print("FizzBuzz")
    elif number %3 == 0:
        print("Fizz")
    elif number %5 ==0:
        print("Buzz")
    else:
        print(number)
# OUTPUT:
# 1
# 2
# Fizz
# 4
# Buzz
# Fizz
# 7
# 8
# Fizz
# Buzz
# 11
# Fizz
# 13
# 14
# FizzBuzz
# 16
# 17
# Fizz
# 19
# Buzz
# Fizz
# 22
# 23
# Fizz
# Buzz
# 26
# Fizz
# 28
# 29
# FizzBuzz
# 31
# 32
# Fizz
# 34
# Buzz
# Fizz
# 37
# 38
# Fizz
# Buzz
# 41
# Fizz
# 43
# 44
# FizzBuzz
# 46
# 47
# Fizz
# 49
# Buzz


# 2. Login Simulation (Max 3 Attempts)
# Ask for a username and password. Allow maximum 3 attempts to enter the correct values ( admin / 1234 ). After 3 wrong tries, print "Account Locked" .
attempt=2
for attempts in range(3):
    userName=input("Enter username: ")
    password=input("Enter Password: ")
    if userName=="admin" and password=="1234":
        print("Login Successful")
        break
    elif attempt > 0:
        print(f" Wrong userName or Password. Remaining Attempts: {attempt}")
        attempt -= 1
    else:
        print("Account Locked")
# OUTPUT 1:
# Enter username: admin
# Enter Password: 1234
# Login Successful

# OUTPUT 2:
# Enter username: riya
# Enter Password: 424
#  Wrong userName or Password. Remaining Attempts: 2
# Enter username: ekif
# Enter Password: 122
#  Wrong userName or Password. Remaining Attempts: 1
# Enter username: rajpriya
# Enter Password: 22
# Account Locked


# 3. Palindrome Checker
# Ask the user to input a word. Print whether the word is a palindrome (reads same forward & backward).
# Example: madam → Palindrome
userInput=input("Enter a Word to check whether it is palindrome or not: ")
reversedString=userInput[::-1]
if userInput.lower() == reversedString.lower():
    print("Palindrome")
else:
    print("Not a Palindrome")
# OUTPUT:
# Enter a Word to check whether it is palindrome or not: Malayalam
# Palindrome


# 4. Prime Numbers in a Range
# Ask user for a number n and print all prime numbers from 1 to n .
# Example: input = 10 → Output: 2, 3, 5, 7
num=int(input("Enter a Number: "))
for i in range(2,num+1):
    for j in range(2,int(i**0.5)+1):
        if i%j==0:
            break
    else:
        print(i,end=" ")
# OUTPUT:
# Enter a Number: 10
# 2 3 5 7


# 5. Star Pyramid
# Use a for loop to print a triangle of stars:
# Example for n = 5:
# *
# **
# ***
# ****
# *****
n=int(input("Enter a number: "))
for i in range(1,n+1):
    for j in range(i):
        print("*",end="")
    print()
# OUTPUT:
# Enter a number: 5
# *
# **
# ***
# ****
# *****


# 6. Sum of Digits
# Ask the user to input a number like 456 Output should be 4 + 5 + 6 = 15
input=int(input("Enter a number: "))
s=0
while(input>0):
    r=input%10
    s=s+r
    input=input//10
print("Sum of the digits: ",s)
# OUTPUT:
# Enter a number: 456
# Sum of the digits:  15


# 7. Multiplication Table Generator
# Ask user for a number, print its multiplication table up to 10.
# Example: 3 → 3 x 1 = 3 ... up to 3 x 10 = 30
mul_num=int(input("Enter a Number: "))
for i in range(1,11):
    print(f"{mul_num} x {i} = ",mul_num*i)
# OUTPUT:
# Enter a Number: 3
# 3 x 1 =  3
# 3 x 2 =  6
# 3 x 3 =  9
# 3 x 4 =  12
# 3 x 5 =  15
# 3 x 6 =  18
# 3 x 7 =  21
# 3 x 8 =  24
# 3 x 9 =  27
# 3 x 10 =  30


# 8. Count Vowels in a String
# Ask user to enter a sentence. Print total number of vowels (a, e, i, o, u) present.
count=0
sentence=input("Enter a Sentence: ")
for i in sentence.lower():
    if (i=='a' or i=='e' or i=='i' or i=='o' or i=='u'):
        count+=1
print("Total NUmber of Vowels: ",count)




