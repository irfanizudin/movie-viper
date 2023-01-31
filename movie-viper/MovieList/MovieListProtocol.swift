//
//  MovieListProtocol.swift
//  movie-viper
//
//  Created by Irfan Izudin on 31/01/23.
//

import Foundation

protocol MovieListViewProtocol {
    var presenter: MovieListPresenterProtocol? { get set }
    func updateWithData(data: [Movie])
    func updateWithError(error: String)
}

protocol MovieListPresenterProtocol {
    var view: MovieListViewProtocol? { get set }
    var interactor: MovieListInteractorProtocol? { get set }
    var router: MovieListRouterProtocol? { get set }
    func viewDidLoadMovieListWithGenreId(id: Int)
    func interactorDidGetMovieListData(result: Result<[Movie], Error>)
}

protocol MovieListInteractorProtocol {
    var presenter: MovieListPresenterProtocol? { get set }
    var genre: Genre? { get set }
    func getMoviesByGenreId(id: Int)
}

protocol MovieListRouterProtocol {
    static func createMovieListModule(genre: Genre) -> MovieListViewController
}
