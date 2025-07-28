#Open Terminal and install pip install-mysql-connector
import mysql.connector

# Step 1: Connect to local MySQL
conn=mysql.connector.connect(
    host='localhost',
    user='root',
    password='Riya@1105',
    database='sql_practice'
)

cursor=conn.cursor()

# #Step 2: Create a table - commit() is not required
# create_table_query="""
# CREATE TABLE IF NOT EXISTS employees (
#     id INT AUTO_INCREMENT PRIMARY KEY,
#     name VARCHAR(100),
#     department VARCHAR(100),
#     salary FLOAT
# );
# """
#
# cursor.execute(create_table_query)
# print("Table 'employees' created successfully.")

#Step 3: Insert sample data
# insert_query="""
# INSERT INTO employees (name,department,salary)
# VALUES
#     ('Rahul Sharma','Engineering',75000),
#     ('Priya Verma','Marketing',60000),
#     ('Anil Kapoor','HR',50000);
# """
# cursor.execute(insert_query)
# conn.commit()
# print("Sample data inserted successfully.")

# Update and Delete
update_query="""UPDATE employees SET salary = 55000 WHERE department='HR';"""
delete_query="""DELETE FROM employees WHERE name='Priya Verma';"""

cursor.execute(update_query)
cursor.execute(delete_query)
conn.commit()
print("Updated the salary of Anil Kapoor and deleted Priya Verma Record")

#Step 4: Close Connection
cursor.close()
conn.close()

