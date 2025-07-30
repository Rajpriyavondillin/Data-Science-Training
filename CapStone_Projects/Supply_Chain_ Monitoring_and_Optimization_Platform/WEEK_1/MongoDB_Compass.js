// MongoDB Compass,
// DB CREATION
use Supply_Chain_DB
// switched to db Supply_Chain_DB

// Store shipment logs 
db["shipment_logs"].find()
db.shipment_logs.insertMany([
  {
    order_id: 101,
    supplier_id: 1,
    shipment_date: new Date("2025-07-01"),
    status: "In Transit",
    location_updates: ["Mumbai", "Pune", "Nagpur"]
  },
  {
    order_id: 102,
    supplier_id: 2,
    shipment_date: new Date("2025-07-02"),
    status: "Delivered",
    location_updates: ["Delhi", "Kanpur", "Lucknow"]
  },
  {
    order_id: 103,
    supplier_id: 3,
    shipment_date: new Date("2025-07-03"),
    status: "In Transit",
    location_updates: ["Chennai", "Vellore"]
  },
  {
    order_id: 104,
    supplier_id: 4,
    shipment_date: new Date("2025-07-04"),
    status: "Delayed",
    location_updates: ["Hyderabad", "Guntur"]
  },
  {
    order_id: 105,
    supplier_id: 5,
    shipment_date: new Date("2025-07-05"),
    status: "In Transit",
    location_updates: ["Bangalore", "Mysore"]
  },
  {
    order_id: 106,
    supplier_id: 1,
    shipment_date: new Date("2025-07-06"),
    status: "Delivered",
    location_updates: ["Mumbai", "Surat"]
  },
  {
    order_id: 107,
    supplier_id: 2,
    shipment_date: new Date("2025-07-07"),
    status: "Pending",
    location_updates: []
  },
  {
    order_id: 108,
    supplier_id: 3,
    shipment_date: new Date("2025-07-08"),
    status: "In Transit",
    location_updates: ["Kolkata", "Ranchi"]
  },
  {
    order_id: 109,
    supplier_id: 4,
    shipment_date: new Date("2025-07-09"),
    status: "Delivered",
    location_updates: ["Bhubaneswar", "Kolkata"]
  },
  {
    order_id: 110,
    supplier_id: 5,
    shipment_date: new Date("2025-07-10"),
    status: "Cancelled",
    location_updates: []
  }
]);


// Create Indexes for efficient querying
db.shipment_logs.createIndex({ order_id: 1});
db.shipment_logs.createIndex({ supplier_id: 1});
supplier_id_1
