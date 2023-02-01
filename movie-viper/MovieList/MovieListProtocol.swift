//
//  MovieListProtocol.swift
//  movie-viper
//
//  Created by Irfan Izudin on 31/01/23.
//

import Foundation

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
}

protocol MovieListInteractorProtocol {
    var presenter: MovieListPresenterProtocol? { get set }
    var genre: Genre? { get set }
    func getMoviesByGenreId(id: Int, page: Int)
}

protocol MovieListRouterProtocol {
    static func createMovieListModule(genre: Genre) -> MovieListViewController
}
