// MongoDB Compass,
// DB CREATION
use Customer_Order_DB
// switched to db Customer_Order_DB

// Store Customer Feedback 
db.customer_feedback.insertMany([
  {
    customer_id: 4,
    order_id: 104,
    feedback_text: "Delivery took longer than expected. Please improve speed.",
    timestamp: new Date("2025-07-08T08:10:00Z")
  },
  {
    customer_id: 2,
    order_id: 102,
    feedback_text: "Received a damaged item. Requesting a refund.",
    timestamp: new Date("2025-07-06T15:30:00Z")
  },
  {
    customer_id: 1,
    order_id: 101,
    feedback_text: "Packaging was really good, but the order arrived late.",
    timestamp: new Date("2025-07-05T10:00:00Z")
  },
  {
    customer_id: 8,
    order_id: 108,
    feedback_text: "Very quick delivery and neat packing. Happy with the service!",
    timestamp: new Date("2025-07-12T14:15:00Z")
  },
  {
    customer_id: 7,
    order_id: 107,
    feedback_text: "App was easy to use. Smooth experience overall.",
    timestamp: new Date("2025-07-11T09:25:00Z")
  },
  {
    customer_id: 3,
    order_id: 103,
    feedback_text: "Amazing service. Totally satisfied!",
    timestamp: new Date("2025-07-07T11:20:00Z")
  },
  {
    customer_id: 10,
    order_id: 110,
    feedback_text: "Ordered but was later informed it's out of stock. Disappointed.",
    timestamp: new Date("2025-07-14T17:45:00Z")
  },
  {
    customer_id: 5,
    order_id: 105,
    feedback_text: "Delivered on time. Appreciate the promptness.",
    timestamp: new Date("2025-07-09T13:40:00Z")
  },
  {
    customer_id: 6,
    order_id: 106,
    feedback_text: "Received a different product than ordered.",
    timestamp: new Date("2025-07-10T16:00:00Z")
  },
  {
    customer_id: 9,
    order_id: 109,
    feedback_text: "Need help processing my refund. Kindly assist.",
    timestamp: new Date("2025-07-13T12:50:00Z")
  }
]);


// Create Indexes for efficient querying
db.customer_feedback.createIndex({ customer_id: 1 });
// customer_id_1
db.customer_feedback.createIndex({order_id:1});
// order_id_1

