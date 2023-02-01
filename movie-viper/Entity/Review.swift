//
//  Review.swift
//  movie-viper
//
//  Created by Irfan Izudin on 01/02/23.
//

import Foundation

struct ReviewResponse: Codable {
    let results: [Review]?
    let total_pages: Int?
}

struct Review: Codable {
    let author: String?
    let author_details: AuthorDetails?
    let content: String?
    let updated_at: String?
}

struct AuthorDetails: Codable {
    let name: String?
    let username: String?
    let avatar_path: String?
    let rating: Double?
}
