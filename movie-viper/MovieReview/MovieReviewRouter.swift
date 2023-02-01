//
//  MovieReviewRouter.swift
//  movie-viper
//
//  Created by Irfan Izudin on 01/02/23.
//

import Foundation

class MovieReviewRouter: MovieReviewRouterProtocol {
    static func createMovieReviewModule(movie: Movie) -> MovieReviewViewController {
        let view = MovieReviewViewController()
        let presenter = MovieReviewPresenter()
        let interactor = MovieReviewInteractor()
        let router = MovieReviewRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
    
    
}
