//
//  MovieTrailerRouter.swift
//  movie-viper
//
//  Created by Irfan Izudin on 01/02/23.
//

import Foundation

class MovieTrailerRouter: MovieTrailerRouterProtocol {
    static func createMovieTrailerModule(movie: Movie) -> MovieTrailerViewController {
        let view = MovieTrailerViewController()
        let presenter = MovieTrailerPresenter()
        let interactor = MovieTrailerInteractor()
        let router = MovieTrailerRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
    
    
}
