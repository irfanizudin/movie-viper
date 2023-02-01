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
    
    var isPaginating: Bool = false
    
    
    func viewDidLoadMovieListWithGenreId(id: Int, page: Int) {
        interactor?.getMoviesByGenreId(id: id, page: page)
    }
    
    func interactorDidGetMovieListData(result: Result<MovieResponse, Error>) {
        switch result {
        case.success(let movieResponse):
            view?.updateWithData(data: movieResponse)
        case.failure(let error):
            view?.updateWithError(error: error.localizedDescription)
        }
    }
    
    
}
