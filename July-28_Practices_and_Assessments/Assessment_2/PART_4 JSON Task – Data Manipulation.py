# Part 4: JSON Task – Data Manipulation

# Use this JSON file: inventory.json [ {"item": "Pen", "stock": 120}, {"item": "Notebook", "stock": 75}, {"item": "Eraser", "stock": 0} ]
# Q6. Write a script to:
# Read the JSON
import json
with open("inventory.json",'r') as f:
    data=json.load(f)

# Add a new field status:
# 'In Stock' if stock > 0
# 'Out of Stock' otherwise
for item in data:
    item['status'] = "In Stock" if item['stock'] > 0 else "Out of stock"

# Save as inventory_updated.json
with open("inventory_cleaned.json",'w') as f:
    json.dump(data,f,indent=4)
print("Copied content to 'inventory_cleaned.json'")

