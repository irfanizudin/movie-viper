//
//  Genre.swift
//  movie-viper
//
//  Created by Irfan Izudin on 31/01/23.
//

import Foundation

struct GenreResponse: Codable {
    let genres: [Genre]?
}

struct Genre: Codable {
    let id: Int
    let name: String
}
