# Part 5: Enrichment with NumPy

# Q7. Generate an array of 20 random student scores between 35 and 100 using NumPy.
import pandas as pd
import numpy as np

scores=np.random.randint(35,101,20)

# Count how many students scored above 75
above_75=np.sum(scores > 75)

# Calculate mean and standard deviation
mean=np.mean(scores)
standard_deviation=np.std(scores)

print("Scores:", scores)
print("Count > 75:", above_75)
print("Mean:", mean)
print("Standard Deviation:", standard_deviation)

# Create a Pandas DataFrame and save as scores.csv
df=pd.DataFrame({'Scores': scores})
df.to_csv("scores.csv",index=False)







