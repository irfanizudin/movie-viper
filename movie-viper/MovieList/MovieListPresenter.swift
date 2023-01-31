//
//  MovieListPresenter.swift
//  movie-viper
//
//  Created by Irfan Izudin on 31/01/23.
//

import Foundation

class MovieListPresenter: MovieListPresenterProtocol {
    var view: MovieListViewProtocol?
    
    var interactor: MovieListInteractorProtocol?
    
    var router: MovieListRouterProtocol?
    
    func viewDidLoadMovieListWithGenreId(id: Int) {
        interactor?.getMoviesByGenreId(id: id)
    }
    
    func interactorDidGetMovieListData(result: Result<[Movie], Error>) {
        switch result {
        case.success(let movies):
            view?.updateWithData(data: movies)
        case.failure(let error):
            view?.updateWithError(error: error.localizedDescription)
        }
    }
    
    
}
