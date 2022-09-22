//
//  Movies.swift
//  MoviesApp
//
//  Created by marco rodriguez on 22/09/22.
//

import Foundation
// MARK: - QuickType

struct Movies: Codable {
    let listOfMovies: [Movie]

    enum CodingKeys: String, CodingKey {
        case listOfMovies = "results"
    }
}

// MARK: - Result
struct Movie: Codable {
    let adult: Bool
    let backdropPath: String
    let genreIDS: [Int]
    let id: Int
    let originalLanguage, originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}


// MARK: - Marco
//
//struct Movies: Codable {
//    let listOfMovies: [Movie]
//
//    enum CodingKeys: String, CodingKey {
//        case listOfMovies = "results"
//    }
//}
//
//struct Movie: Codable {
//    let title: String
//    let popularity: Double
//    let movieID: Int
//    let voteCount: Int
//    let originalTitle: String
//    let voteAverage: Double
//    let sinopsis: String
//    let releaseDate: String
//    let image: String
//
//    enum CodingKeys: String, CodingKey {
//        case title
//        case popularity
//        case movieID = "id"
//        case voteCount = "vote_count"
//        case originalTitle = "original_title"
//        case voteAverage = "vote_average"
//        case sinopsis = "overview"
//        case releaseDate = "release_data"
//        case image = "poster_path"
//    }
//}
