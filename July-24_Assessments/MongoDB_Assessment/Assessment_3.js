// MongoDB Assignment: Design & Query Challenge
use JobPortalDB

// Part 1: Create Collections and Insert Your Own Data

// 1. jobs
db.jobs.insertMany([
  { _id: 1, job_title: "Software Engineer", company: "TCS", location: "Mumbai", salary: 1200000, job_type: "remote", posted_on: new Date("2025-07-01") },
  { _id: 2, job_title: "Data Analyst", company: "Infosys", location: "Hyderabad", salary: 900000, job_type: "hybrid", posted_on: new Date("2025-06-15") },
  { _id: 3, job_title: "Backend Developer", company: "Wipro", location: "Chennai", salary: 1100000, job_type: "remote", posted_on: new Date("2025-07-10") },
  { _id: 4, job_title: "Frontend Developer", company: "TCS", location: "Delhi", salary: 1050000, job_type: "on-site", posted_on: new Date("2025-05-25") },
  { _id: 5, job_title: "DevOps Engineer", company: "HCL", location: "Pune", salary: 1300000, job_type: "remote", posted_on: new Date("2025-07-05") },
  { _id: 6, job_title: "System Analyst", company: "Infosys", location: "Bangalore", salary: 1000000, job_type: "hybrid", posted_on: new Date("2025-07-20") },
  { _id: 7, job_title: "AI Engineer", company: "Wipro", location: "Hyderabad", salary: 1500000, job_type: "remote", posted_on: new Date("2025-06-28") },
  { _id: 8, job_title: "QA Engineer", company: "TCS", location: "Mumbai", salary: 850000, job_type: "on-site", posted_on: new Date("2025-07-18") }
])

// 2. applicants
db.applicants.insertMany([
  { _id: 1, name: "Aarav", skills: ["Java", "MongoDB"], experience: 3, city: "Mumbai", applied_on: new Date("2025-07-05") },
  { _id: 2, name: "Neha", skills: ["Python", "SQL"], experience: 2, city: "Hyderabad", applied_on: new Date("2025-07-06") },
  { _id: 3, name: "Karan", skills: ["Node.js", "React", "MongoDB"], experience: 4, city: "Chennai", applied_on: new Date("2025-07-10") },
  { _id: 4, name: "Divya", skills: ["C++", "MySQL"], experience: 1, city: "Pune", applied_on: new Date("2025-06-20") },
  { _id: 5, name: "Rahul", skills: ["Java", "Spring"], experience: 5, city: "Hyderabad", applied_on: new Date("2025-07-08") },
  { _id: 6, name: "Sneha", skills: ["MongoDB", "Express", "JavaScript"], experience: 3, city: "Delhi", applied_on: new Date("2025-07-02") },
  { _id: 7, name: "Vikram", skills: ["HTML", "CSS", "JavaScript"], experience: 2, city: "Bangalore", applied_on: new Date("2025-07-09") },
  { _id: 8, name: "Pooja", skills: ["Python", "MongoDB"], experience: 1, city: "Mumbai", applied_on: new Date("2025-07-12") }
])

// 3. applications
db.applications.insertMany([
  { _id: 1, applicant_id: 1, job_id: 1, application_status: "interview scheduled", interview_scheduled: true, feedback: "Positive" },
  { _id: 2, applicant_id: 3, job_id: 3, application_status: "under review", interview_scheduled: false, feedback: "" },
  { _id: 3, applicant_id: 2, job_id: 2, application_status: "rejected", interview_scheduled: false, feedback: "Skills mismatch" },
  { _id: 4, applicant_id: 4, job_id: 4, application_status: "interview scheduled", interview_scheduled: true, feedback: "" },
  { _id: 5, applicant_id: 1, job_id: 5, application_status: "under review", interview_scheduled: false, feedback: "" },
  { _id: 6, applicant_id: 6, job_id: 6, application_status: "interview scheduled", interview_scheduled: true, feedback: "Good" },
  { _id: 7, applicant_id: 5, job_id: 1, application_status: "under review", interview_scheduled: false, feedback: "" },
  { _id: 8, applicant_id: 8, job_id: 7, application_status: "under review", interview_scheduled: false, feedback: "" }
])



// Part 2: Write the Following Queries
// 1. Find all remote jobs with a salary greater than 10,00,000.
db.jobs.find({job_type:"remote",salary:{$gt:1000000}})

// 2. Get all applicants who know MongoDB.
db.applicants.find({skills:"MongoDB"})

// 3. Show the number of jobs posted in the last 30 days.
db.jobs.countDocuments({posted_on:{$gte:new Date(Date.now()-30*24*60*60*1000)}})

// 4. List all job applications that are in ‘interview scheduled’ status.
db.applications.find({application_status:"interview scheduled"})

// 5. Find companies that have posted more than 2 jobs.
db.jobs.aggregate([
  {$group:{_id:"$company",totalJobs:{$sum:1}}},
  {$match:{totalJobs:{$gt:2}}}
])


// Part 3: Use $lookup and Aggregation
// 6. Join applications with jobs to show job title along with the applicant’s name.
db.applications.aggregate([
  {
    $lookup: {
      from:"jobs",
      localField:"job_id",
      foreignField:"_id",
      as:"job_info"
    }
  },
  {$unwind:"$job_info"},
  {
    $lookup:{
      from:"applicants",
      localField:"applicant_id",
      foreignField:"_id",
      as:"applicant_info"
    }
  },
  {$unwind:"$applicant_info"},
  {
    $project:{
      _id: 0,
      job_title:"$job_info.job_title",
      applicant_name:"$applicant_info.name"
    }
  }
])

// 7. Find how many applications each job has received.
db.applications.aggregate([
  {$group:{_id:"$job_id",totalApplications:{$sum:1}}}
])

// 8. List applicants who have applied for more than one job.
db.applications.aggregate([
  {$group:{_id:"$applicant_id",applicationCount:{$sum:1}}},
  {$match:{applicationCount:{$gt:1}}}
])

// 9. Show the top 3 cities with the most applicants.
db.applicants.aggregate([
  {$group:{_id:"$city",count:{$sum:1}}},
  {$sort:{count:-1}},
  {$limit:3}
])

// 10. Get the average salary for each job type (remote, hybrid, on-site).
db.jobs.aggregate([
  {$group:{_id:"$job_type",avgSalary:{$avg:"$salary"}}}
])


// Part 4: Data Updates
// 11. Update the status of one application to "offer made".
db.applications.updateOne({_id:2},{$set:{application_status:"offer made"}})

// 12. Delete a job that has not received any applications.
// Find job_ids with applications
const appliedJobIds=db.applications.distinct("job_id")
// Delete jobs not in that list
db.jobs.deleteMany({_id:{$nin:appliedJobIds}})

// 13. Add a new field shortlisted to all applications and set it to false.
db.applications.updateMany({},{$set:{shortlisted:false}})

// 14. Increment experience of all applicants from "Hyderabad" by 1 year.
db.applicants.updateMany({city:"Hyderabad"},{$inc:{experience:1}})

// 15. Remove all applicants who haven’t applied to any job.
const appliedApplicantIds=db.applications.distinct("applicant_id")
db.applicants.deleteMany({_id:{$nin:appliedApplicantIds}})




