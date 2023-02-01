//
//  MovieListProtocol.swift
//  movie-viper
//
//  Created by Irfan Izudin on 31/01/23.
//

import Foundation
import UIKit

protocol MovieListViewProtocol {
    var presenter: MovieListPresenterProtocol? { get set }
    func updateWithData(data: MovieResponse)
    func updateWithError(error: String)
}

protocol MovieListPresenterProtocol {
    var view: MovieListViewProtocol? { get set }
    var interactor: MovieListInteractorProtocol? { get set }
    var router: MovieListRouterProtocol? { get set }
    func viewDidLoadMovieListWithGenreId(id: Int, page: Int)
    func interactorDidGetMovieListData(result: Result<MovieResponse, Error>)
    func tapMovieDetail(movie: Movie, view: UIViewController)
}

protocol MovieListInteractorProtocol {
    var presenter: MovieListPresenterProtocol? { get set }
//    var genre: Genre? { get set }
    func getMoviesByGenreId(id: Int, page: Int)
}

protocol MovieListRouterProtocol {
    static func createMovieListModule(genre: Genre) -> MovieListViewController
    func pushToMovieDetail(movie: Movie, view: UIViewController)
}
