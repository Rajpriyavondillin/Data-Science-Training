# Part 3: CSV Task – Data Cleaning

# Use this CSV file: orders.csv
# OrderID,CustomerName,Item,Quantity,Price
# 101,Aarav,Notebook,2,50
# 102,Sanya,Pen,5,20
# 103,Rohan,,3,25
# 104,,Marker,4,
# 105,Meera,Eraser,,10

# CREATED

# Q5. Write a Python script using Pandas to:
import pandas as pd

df=pd.read_csv("orders.csv")

# Fill missing CustomerName with 'Unknown'
df['CustomerName']=df['CustomerName'].fillna('Unknown')

# Fill missing Quantity and Price with 0
df['Quantity']=df['Quantity'].fillna(0)
df['Price']=df['Price'].fillna(0)

# Add column TotalAmount = Quantity * Price
df['TotalAmount']=df['Quantity'] * df['Price']

# Save cleaned data to orders_cleaned.csv
df.to_csv("orders_cleaned.csv",index=False)