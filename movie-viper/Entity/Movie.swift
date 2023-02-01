//
//  Movie.swift
//  movie-viper
//
//  Created by Irfan Izudin on 31/01/23.
//

import Foundation

struct MovieResponse: Codable {
    let results: [Movie]?
    let total_pages: Int?
}

struct Movie: Codable {
    let id: Int?
    let title: String?
    let original_title: String?
    let overview: String?
    let poster_path: String?
    let release_date: String?
    let vote_average: Double?
}
