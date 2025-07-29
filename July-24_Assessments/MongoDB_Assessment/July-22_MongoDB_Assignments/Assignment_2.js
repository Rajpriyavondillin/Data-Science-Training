// MongoDB Assignment – Movie Streaming App

// Scenario:
// You're hired as a MongoDB developer for a movie streaming startup. You need to build the database to store information about users, movies, and their viewing history.

// PART 1: Create Collections
// Create the following 3 collections:

// 1. users
// Fields:
// user_id (Number)
// name (String)
// email (String)
// country (String)

// 2. movies
// Fields:
// movie_id (Number)
// title (String)
// genre (String)
// release_year (Number)
// duration (Number in minutes)

// 3. watch_history
// Fields:
// watch_id (Number)
// user_id (Number)
// movie_id (Number)
// watched_on (Date)
// watch_time (Number in minutes)

//Database
use movieStreamingDB

// Creating collections
//users
db.createCollection("users")
//movies
db.createCollection("movies")
//watch_history
db.createCollection("watch_history")


// PART 2: Insert Sample Data
// Insert:
// 5 users (from various countries)
// 6 movies (from different genres)
// 8 watch_history entries (some users watch the same movie multiple times)


db.users.insertMany([
  { user_id: 1, name: "Raj", email: "raj@mail.com", country: "India" },
  { user_id: 2, name: "Ava", email: "ava@mail.com", country: "USA" },
  { user_id: 3, name: "John", email: "john@mail.com", country: "UK" },
  { user_id: 4, name: "Liam", email: "liam@mail.com", country: "Canada" },
  { user_id: 5, name: "Mira", email: "mira@mail.com", country: "India" }
])


db.movies.insertMany([
  { movie_id: 101, title: "Dream Beyond Code", genre: "Sci-Fi", release_year: 2022, duration: 120 },
  { movie_id: 102, title: "Love in Paris", genre: "Romance", release_year: 2021, duration: 95 },
  { movie_id: 103, title: "The Great Heist", genre: "Action", release_year: 2019, duration: 110 },
  { movie_id: 104, title: "Life's Melody", genre: "Drama", release_year: 2023, duration: 105 },
  { movie_id: 105, title: "Horror Nights", genre: "Horror", release_year: 2020, duration: 90 },
  { movie_id: 106, title: "Comic Blast", genre: "Comedy", release_year: 2024, duration: 100 }
])


db.watch_history.insertMany([
  { watch_id: 1, user_id: 1, movie_id: 101, watched_on: new Date("2025-07-01"), watch_time: 100 },
  { watch_id: 2, user_id: 2, movie_id: 103, watched_on: new Date("2025-07-02"), watch_time: 110 },
  { watch_id: 3, user_id: 1, movie_id: 101, watched_on: new Date("2025-07-05"), watch_time: 120 },
  { watch_id: 4, user_id: 3, movie_id: 102, watched_on: new Date("2025-07-04"), watch_time: 95 },
  { watch_id: 5, user_id: 4, movie_id: 104, watched_on: new Date("2025-07-03"), watch_time: 105 },
  { watch_id: 6, user_id: 5, movie_id: 101, watched_on: new Date("2025-07-06"), watch_time: 120 },
  { watch_id: 7, user_id: 1, movie_id: 105, watched_on: new Date("2025-07-07"), watch_time: 90 },
  { watch_id: 8, user_id: 1, movie_id: 106, watched_on: new Date("2025-07-08"), watch_time: 100 }
])


// PART 3: Query Tasks
// Basic:
// 1. Find all movies with duration > 100 minutes.
db.movies.find({ duration: { $gt: 100 } })

// 2. List users from 'India'.
db.users.find({ country: "India" })

// 3. Get all movies released after 2020.
db.movies.find({ release_year: { $gt: 2020 } })


// Intermediate:
// 4. Show full watch history: user name, movie title, watch time
db.watch_history.aggregate([
  {
    $lookup: {
      from: "users",
      localField: "user_id",
      foreignField: "user_id",
      as: "user"
    }
  },
  { $unwind: "$user" },
  {
    $lookup: {
      from: "movies",
      localField: "movie_id",
      foreignField: "movie_id",
      as: "movie"
    }
  },
  { $unwind: "$movie" },
  {
    $project: {
      _id: 0,
      user_name: "$user.name",
      movie_title: "$movie.title",
      watch_time: 1
    }
  }
])


// 5. List each genre and number of times movies in that genre were watched
db.watch_history.aggregate([
  {
    $lookup: {
      from: "movies",
      localField: "movie_id",
      foreignField: "movie_id",
      as: "movie"
    }
  },
  { $unwind: "$movie" },
  {
    $group: {
      _id: "$movie.genre",
      watch_count: { $sum: 1 }
    }
  }
])


// 6. Display total watch time per user
db.watch_history.aggregate([
  {
    $group: {
      _id: "$user_id",
      total_watch_time: { $sum: "$watch_time" }
    }
  },
  {
    $lookup: {
      from: "users",
      localField: "_id",
      foreignField: "user_id",
      as: "user"
    }
  },
  { $unwind: "$user" },
  {
    $project: {
      _id: 0,
      user_name: "$user.name",
      total_watch_time: 1
    }
  }
])

// Advanced:
// 7. Find which movie has been watched the most (by count).
db.watch_history.aggregate([
  {
    $group: {
      _id: "$movie_id",
      watch_count: { $sum: 1 }
    }
  },
  { $sort: { watch_count: -1 } },
  { $limit: 1 },
  {
    $lookup: {
      from: "movies",
      localField: "_id",
      foreignField: "movie_id",
      as: "movie"
    }
  },
  { $unwind: "$movie" },
  {
    $project: {
      movie_title: "$movie.title",
      watch_count: 1
    }
  }
])

// 8. Identify users who have watched more than 2 movies.
db.watch_history.aggregate([
  {
    $group: {
      _id: "$user_id",
      movie_ids: { $addToSet: "$movie_id" }
    }
  },
  {
    $project: {
      movie_count: { $size: "$movie_ids" }
    }
  },
  { $match: { movie_count: { $gt: 2 } } },
  {
    $lookup: {
      from: "users",
      localField: "_id",
      foreignField: "user_id",
      as: "user"
    }
  },
  { $unwind: "$user" },
  {
    $project: {
      user_name: "$user.name",
      movie_count: 1
    }
  }
])

// 9. Show users who watched the same movie more than once.
db.watch_history.aggregate([
  {
    $group: {
      _id: { user_id: "$user_id", movie_id: "$movie_id" },
      count: { $sum: 1 }
    }
  },
  { $match: { count: { $gt: 1 } } },
  {
    $lookup: {
      from: "users",
      localField: "_id.user_id",
      foreignField: "user_id",
      as: "user"
    }
  },
  { $unwind: "$user" },
  {
    $lookup: {
      from: "movies",
      localField: "_id.movie_id",
      foreignField: "movie_id",
      as: "movie"
    }
  },
  { $unwind: "$movie" },
  {
    $project: {
      user_name: "$user.name",
      movie_title: "$movie.title",
      watch_count: "$count"
    }
  }
])

// 10. Calculate percentage of each movie watched compared to its full duration ( watch_time/duration * 100 ).
db.watch_history.aggregate([
  {
    $lookup: {
      from: "movies",
      localField: "movie_id",
      foreignField: "movie_id",
      as: "movie"
    }
  },
  { $unwind: "$movie" },
  {
    $project: {
      user_id: 1,
      movie_title: "$movie.title",
      percentage_watched: {
        $multiply: [
          { $divide: ["$watch_time", "$movie.duration"] },
          100
        ]
      }
    }
  }
])
