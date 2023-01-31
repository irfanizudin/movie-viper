//
//  MovieListRouter.swift
//  movie-viper
//
//  Created by Irfan Izudin on 31/01/23.
//

import Foundation

class MovieListRouter: MovieListRouterProtocol {
    static func createMovieListModule(genre: Genre) -> MovieListViewController {
        let view = MovieListViewController()
        let presenter = MovieListPresenter()
        let interactor = MovieListInteractor()
        let router = MovieListRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        interactor.genre = genre
        
        return view
    }
    
    
}
