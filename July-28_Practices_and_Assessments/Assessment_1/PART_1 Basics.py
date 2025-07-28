# Part 1: Basics

# Q1. Write a function is_prime(n) that returns True if n is a prime number, else False .
def is_prime(n):
    if n <= 1:
        return False
    for i in range(2,int(n**0.5)+1):
        if n%i == 0:
            return False
    return True

n=int(input("Enter the Number to check PRIME or NOT: "))
result=is_prime(n)

if result:
    print(f"The number {n} is PRIME")
else:
    print(f"The number {n} is NOT_PRIME")




# Q2. Write a program that:
# Accepts a string
# Reverses it
# Checks if it's a palindrome
string=input("Enter a string to know if it is a PALINDROME or NOT: ")
rev_string=string[::-1]

if string.lower()==rev_string.lower():
    print(f"The String '{string}' is PALINDROME")
else:
    print(f"The String '{string}' is NOT_PALINDROME")




# Q3. Given a list of numbers, write code to:
number=int(input("Enter the number of elements: "))
numbers_list=[]

for i in range(number):
    element=int(input(f"Enter element {i+1}: "))
    numbers_list.append(element)

print(numbers_list)

# Remove duplicates
unique_list=[]
for i in numbers_list:
    if i not in unique_list:
        unique_list.append(i)
print(unique_list)

# Sort them
# unique_list.sort()  # Ascending order
unique_list.sort(reverse=True) # Descending order
print(unique_list)

# Print the second largest number
print("The second largest number is: ",unique_list[1])