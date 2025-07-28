# PART_4: Data Cleaning and Transformation

# Q8. Using Pandas and NumPy, perform the following on students_cleaned.csv :
# Add a column Status where:
# If score ≥ 85 → 'Distinction'
# 60 ≤ score < 85 → 'Passed'
# Else → 'Failed'
# Add another column Tax_ID with values like 'TAX-1' , 'TAX-2' , etc., using the ID column.

import pandas as pd
import numpy as np
df=pd.read_csv("students_cleaned.csv")

def get_status(score):
    if score >= 85:
        return 'Distinction'
    elif score >= 60:
        return 'Passed'
    else:
        return 'Failed'

df['Status']=df['Score'].apply(get_status)

df['Tax_ID'] = df['ID'].apply(lambda x: f"TAX-{x}")

df.to_csv("Students_Transformed.csv",index=False)


