//
//  MovieDetailProtocol.swift
//  movie-viper
//
//  Created by Irfan Izudin on 01/02/23.
//

import Foundation
import UIKit

protocol MovieDetailViewProtocol {
    var presenter: MovieDetailPresenterProtocol? { get set }
    func updateWithData(data: Movie)
    func updateWithError(error: String)
}

protocol MovieDetailPresenterProtocol {
    var view: MovieDetailViewProtocol? { get set }
    var interactor: MovieDetailInteractorProtocol? { get set }
    var router: MovieDetailRouterProtocol? { get set }
    func viewDidLoadMovieDetailById(id: Int)
    func interactorDidGetMoviDetailData(result: Result<Movie, Error>)
    func tapUserReviewButton(movie: Movie, view: UIViewController)
    func tapWatchTrailerButton(movie: Movie, view: UIViewController)
}

protocol MovieDetailInteractorProtocol {
    var presenter: MovieDetailPresenterProtocol? { get set }
    var movie: Movie? { get set }
    func getMovieDetailById(id: Int)
}

protocol MovieDetailRouterProtocol {
    static func createMovieDetailModule(movie: Movie) -> MovieDetailViewController
    func presentUserReview(movie: Movie, view: UIViewController)
    func presentWatchTrailer(movie: Movie, view: UIViewController)
}
