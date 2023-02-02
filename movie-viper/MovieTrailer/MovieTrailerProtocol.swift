//
//  MovieTrailerProtocol.swift
//  movie-viper
//
//  Created by Irfan Izudin on 01/02/23.
//

import Foundation

protocol MovieTrailerViewProtocol {
    var presenter: MovieTrailerPresenterProtocol? { get set }
    func updateWithData(videoId: String)
    func updateWithError(error: String)
}

protocol MovieTrailerPresenterProtocol {
    var view: MovieTrailerViewProtocol? { get set }
    var interactor: MovieTrailerInteractorProtocol? { get set }
    var router: MovieTrailerRouterProtocol? { get set }
    func viewDidLoadYoutubeVideo(query: String)
    func interactorDidGetYoutubeVideo(result: Result<String, Error>)
    
}

protocol MovieTrailerInteractorProtocol {
    var presenter: MovieTrailerPresenterProtocol? { get set }
    func getYoutubeVideoByQuery(query: String)
}

protocol MovieTrailerRouterProtocol {
    static func createMovieTrailerModule(movie: Movie) -> MovieTrailerViewController
}
