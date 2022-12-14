//
//  Constants.swift
//  MoviesApp
//
//  Created by marco rodriguez on 19/09/22.
// Este curso es de Youtube

import Foundation

struct Constants {
    
    static let apiKey = "?api_key=2cfa8720256036601fb9ac4e4bce1a9b"
    
    struct URL {
        static let main = "https://api.themoviedb.org/"
        static let urlImages = "https://image.tmdb.org/t/p/w200"
    }
    
    struct Endpoints {
        static let urlListPopularMovies = "3/movie/popular"
        static let urlImages = "https://image.tmdb.org/t/p/w200"
        static let urlDetailMovie = "3/movie/"
    }
    
}
