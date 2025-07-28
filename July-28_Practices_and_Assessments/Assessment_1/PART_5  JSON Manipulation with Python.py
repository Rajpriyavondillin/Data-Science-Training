# PART_5: JSON manipulation with python

# Use the below sample JSON in a file products.json :
# [
# {"id": 1, "name": "Pen", "price": 20},
# {"id": 2, "name": "Notebook", "price": 45},
# {"id": 3, "name": "Eraser", "price": 10}
# ]

# Q9. Write a script to:
import json

# Read the JSON
with open("products.json",'r') as f:
    products=json.load(f)

# Increase all prices by 10%
for p in products:
    p['price']=round(p['price'] * 1.10, 2)

# Save back to products_updated.json
with open("products_updated.json",'w') as f:
    json.dump(products,f,indent=4)