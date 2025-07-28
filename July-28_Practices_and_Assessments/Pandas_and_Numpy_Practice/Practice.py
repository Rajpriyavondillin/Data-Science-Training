# Open terminal and install - pip install pandas numpy

import pandas as pd
import numpy as np

# ETL - Extract, Transform and Load data
# Extract the data - Get data from multiple files like json,notepad etc.,
# Transform the data - Raw data converted into DataFrame,
# -- that is convert Data into Table like structure but not exactly tables(can be done using pandas pd.DataFrame()
# Load the data -

# Sample raw data (intentionally messy)
raw_data = {
    'EmpID': [201, 202, 203, 204, 205, 206],
    'Name': ['Aarav', 'Sanya', None, 'Karthik', 'Meera', None],  # Missing names
    'Age': [24, np.nan, 29, 22, 31, np.nan],                    # Missing ages
    'Department': ['Finance', 'Tech', 'HR', None, 'Marketing', None],  # Missing departments
    'Salary': ['52000', '73000', 'not available', '48000', '61000', None]  # Invalid and missing salary
}

df=pd.DataFrame(raw_data)
print("Raw Data: \n",df)


# ---------------------------------- CLEANING ----------------------------------

# Filling missing names with "Unknown"
# (To make inconsistent to Consistent, if we have same values then we can do some operations so do these)
# fillna() is used to perform this
df['Name']=df['Name'].fillna('Unknown')

# Fill missing departments with "Not Assigned"
df['Department']=df['Department'].fillna('Not Assigned')

# Convert salary to numeric (handle non-numeric gracefully)
# coerce - NAN
df['Salary']=pd.to_numeric(df['Salary'],errors='coerce')

# Fill missing Age and Salary with their respective means
# For survey purpose we can use this instead of NAN we can calculate mean and place there
df['Age']=df['Age'].fillna(df['Age'].mean())
df['Salary']=df['Salary'].fillna(df['Salary'].mean())

print("\nCleaned Data:\n",df)
# So, we have cleaned/ manipulated/ transformed the data




# -------------------CSV-----------------------
import pandas as pd

# Read from a CSV file
df=pd.read_csv('employees.csv')
print("\nCSV Read:\n",df)

# Write to a new CSV file
df.to_csv('updated_employees.csv',index=False)
print("CSV written to updated_employees.csv")
print()



# -------------------JSON-----------------------
import json

# Reading JSON file
with open('data.json','r') as f:
    data=json.load(f)
print("JSON Read:\n",data)

# Writing JSON file
with open('output.json','w') as f:
    json.dump(data,f,indent=4)
print("JSON written to output.json")