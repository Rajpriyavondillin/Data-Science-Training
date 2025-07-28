# Part 3: CSV & JSON Handling

# Use the following sample students.csv for this section:
# students.csv (you may create it in the same directory):
# ID,Name,Age,Score
# 1,Aarav,18,85
# 2,Sanya,17,90
# 3,Meera,19,NaN
# 4,Karthik,,78
# 5,Rohan,18,88

# CREATED


# Q6. Read the students.csv and:
import pandas as pd
import numpy as np

df=pd.read_csv("students.csv")
print("CSV Data: \n",df)

# Fill missing Age with average age
df['Age']=df['Age'].fillna(df['Age'].mean())

# Fill missing Score with 0
df['Score']=df['Score'].fillna(0)

# Save the cleaned data as students_cleaned.csv
df.to_csv("students_cleaned.csv",index=False)
print("\nCleaned CSV Data: \n",df)




# Q7. Convert the cleaned CSV into JSON and save as students.json
df_cleaned=pd.read_csv("students_cleaned.csv")
df_cleaned.to_json("students.json", orient="records", indent=4)
print("\nData saved as JSON in 'students.json'")


