//
//  Youtube.swift
//  movie-viper
//
//  Created by Irfan Izudin on 02/02/23.
//

import Foundation

struct YoutubeResponse: Codable {
    let items: [VideoElement]?
}

struct VideoElement: Codable {
    let id: VideoID?
}

struct VideoID: Codable {
    let videoId: String?
}
