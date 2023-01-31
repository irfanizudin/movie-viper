//
//  Movie.swift
//  movie-viper
//
//  Created by Irfan Izudin on 31/01/23.
//

import Foundation

struct MovieResponse: Codable {
    let results: [Movie]?
}

struct Movie: Codable {
    let title: String?
    let original_title: String?
    let overview: String?
    let poster_path: String?
    let release_date: String?
    let vote_average: Double?
}
