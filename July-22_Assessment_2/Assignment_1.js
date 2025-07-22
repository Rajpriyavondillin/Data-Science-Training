MongoDB Practical Assignment – Bookstore Management
Objective:
Design a MongoDB database for managing a bookstore. You'll create collections, insert
documents, and write queries to analyze inventory and customer orders.


PART 1: Create Collections
Create the following 3 collections in a database named bookstoreDB :

1. books
Fields:
book_id (Number)
title (String)
author (String)
genre (String)
price (Number)
stock (Number)


2. customers
Fields:
customer_id (Number)
name (String)
email (String)
city (String)


3. orders
Fields:
order_id (Number)
customer_id (Number)
book_id (Number)
order_date (ISODate)
quantity (Number)

//Database
use bookstoreDB

// Creating collections
db.createCollection("books")
db.createCollection("customers")
db.createCollection("orders")

PART 2: Insert Sample Data
Insert at least:
5 books (mix of genres and price points)
5 customers (different cities)
7 orders (various combinations of books & customers)

db.books.insertMany([
  { book_id: 101, title: "The AI Revolution", author: "Ray Kurzweil", genre: "Technology", price: 799, stock: 20 },
  { book_id: 102, title: "Atomic Habits", author: "James Clear", genre: "Self-Help", price: 450, stock: 15 },
  { book_id: 103, title: "The Alchemist", author: "Paulo Coelho", genre: "Fiction", price: 550, stock: 10 },
  { book_id: 104, title: "Sapiens", author: "Yuval Noah Harari", genre: "History", price: 699, stock: 12 },
  { book_id: 105, title: "Clean Code", author: "Robert C. Martin", genre: "Programming", price: 999, stock: 8 }
])


db.customers.insertMany([
  { customer_id: 1, name: "Anjali Sharma", email: "anjali@example.com", city: "Hyderabad" },
  { customer_id: 2, name: "Rahul Verma", email: "rahul@example.com", city: "Delhi" },
  { customer_id: 3, name: "Sneha Rao", email: "sneha@example.com", city: "Mumbai" },
  { customer_id: 4, name: "Vikram Patel", email: "vikram@example.com", city: "Hyderabad" },
  { customer_id: 5, name: "Neha Jain", email: "neha@example.com", city: "Chennai" }
])


db.orders.insertMany([
  { order_id: 201, customer_id: 1, book_id: 101, order_date: ISODate("2023-02-10"), quantity: 1 },
  { order_id: 202, customer_id: 2, book_id: 102, order_date: ISODate("2023-03-15"), quantity: 2 },
  { order_id: 203, customer_id: 3, book_id: 103, order_date: ISODate("2022-12-25"), quantity: 1 },
  { order_id: 204, customer_id: 4, book_id: 104, order_date: ISODate("2023-05-20"), quantity: 3 },
  { order_id: 205, customer_id: 1, book_id: 105, order_date: ISODate("2023-07-01"), quantity: 1 },
  { order_id: 206, customer_id: 5, book_id: 101, order_date: ISODate("2023-08-12"), quantity: 2 },
  { order_id: 207, customer_id: 1, book_id: 103, order_date: ISODate("2023-10-05"), quantity: 1 }
])


PART 3: Write Queries
Basic Queries:
1. List all books priced above 500.
db.books.find({ price: { $gt: 500 } })

2. Show all customers from ‘Hyderabad’.
db.customers.find({ city: "Hyderabad" })


3. Find all orders placed after January 1, 2023.
db.orders.find({ order_date: { $gt: ISODate("2023-01-01") } })


Joins via $lookup :
4. Display order details with customer name and book title.
db.orders.aggregate([
  {
    $lookup: {
      from: "customers",
      localField: "customer_id",
      foreignField: "customer_id",
      as: "customer_info"
    }
  },
  {
    $lookup: {
      from: "books",
      localField: "book_id",
      foreignField: "book_id",
      as: "book_info"
    }
  },
  {
    $project: {
      order_id: 1,
      order_date: 1,
      quantity: 1,
      customer_name: { $arrayElemAt: ["$customer_info.name", 0] },
      book_title: { $arrayElemAt: ["$book_info.title", 0] }
    }
  }
])


5. Show total quantity ordered for each book.
db.orders.aggregate([
  {
    $group: {
      _id: "$book_id",
      total_quantity: { $sum: "$quantity" }
    }
  },
  {
    $lookup: {
      from: "books",
      localField: "_id",
      foreignField: "book_id",
      as: "book_info"
    }
  },
  {
    $project: {
      book_title: { $arrayElemAt: ["$book_info.title", 0] },
      total_quantity: 1
    }
  }
])


6. Show the total number of orders placed by each customer.
db.orders.aggregate([
  {
    $group: {
      _id: "$customer_id",
      total_orders: { $sum: 1 }
    }
  },
  {
    $lookup: {
      from: "customers",
      localField: "_id",
      foreignField: "customer_id",
      as: "customer_info"
    }
  },
  {
    $project: {
      customer_name: { $arrayElemAt: ["$customer_info.name", 0] },
      total_orders: 1
    }
  }
])


Aggregation Queries:
7. Calculate total revenue generated per book.
db.orders.aggregate([
  {
    $lookup: {
      from: "books",
      localField: "book_id",
      foreignField: "book_id",
      as: "book_info"
    }
  },
  {
    $unwind: "$book_info"
  },
  {
    $group: {
      _id: "$book_id",
      book_title: { $first: "$book_info.title" },
      revenue: { $sum: { $multiply: ["$quantity", "$book_info.price"] } }
    }
  }
])


8. Find the book with the highest total revenue.
db.orders.aggregate([
  {
    $lookup: {
      from: "books",
      localField: "book_id",
      foreignField: "book_id",
      as: "book_info"
    }
  },
  { $unwind: "$book_info" },
  {
    $group: {
      _id: "$book_id",
      book_title: { $first: "$book_info.title" },
      revenue: { $sum: { $multiply: ["$quantity", "$book_info.price"] } }
    }
  },
  { $sort: { revenue: -1 } },
  { $limit: 1 }
])


9. List genres and total books sold in each genre.
db.orders.aggregate([
  {
    $lookup: {
      from: "books",
      localField: "book_id",
      foreignField: "book_id",
      as: "book_info"
    }
  },
  { $unwind: "$book_info" },
  {
    $group: {
      _id: "$book_info.genre",
      total_books_sold: { $sum: "$quantity" }
    }
  }
])


10. Show customers who ordered more than 2 different books.
db.orders.aggregate([
  {
    $group: {
      _id: "$customer_id",
      unique_books: { $addToSet: "$book_id" }
    }
  },
  {
    $project: {
      customer_id: "$_id",
      num_books: { $size: "$unique_books" }
    }
  },
  { $match: { num_books: { $gt: 2 } } },
  {
    $lookup: {
      from: "customers",
      localField: "customer_id",
      foreignField: "customer_id",
      as: "customer_info"
    }
  },
  {
    $project: {
      customer_name: { $arrayElemAt: ["$customer_info.name", 0] },
      num_books: 1
    }
  }
])

