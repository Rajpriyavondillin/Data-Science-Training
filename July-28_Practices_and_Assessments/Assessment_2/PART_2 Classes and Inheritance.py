# Part 2: Classes and Inheritance

# Q3. Create a class BankAccount with:
# Attributes: holder_name, balance
# Method: deposit(amount) and withdraw(amount)
# Raise an exception if withdrawal amount exceeds balance
class BankAccount:
    def __init__(self,holder_name,balance):
        self.holder_name=holder_name
        self.balance=balance

    def deposit(self,amount):
        self.balance += amount

    def withdraw(self,amount):
        if amount > self.balance:
            raise Exception("Insufficient Balance.")
        self.balance -= amount




# Q4. Inherit a SavingsAccount class from BankAccount that adds:
# Attribute: interest_rate
# Method: apply_interest() that updates the balance
class SavingsAccount(BankAccount):
    def __init__(self,holder_name,balance,interest_rate):
        super().__init__(holder_name,balance)
        self.interest_rate=interest_rate

    def apply_interest(self):
        interest=self.balance * self.interest_rate / 100
        self.balance += interest

acc=SavingsAccount("Ram",1000,10)
acc.apply_interest()
print("Balance with added Interest: ",acc.balance)





