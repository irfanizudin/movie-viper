//
//  MovieDetailRouter.swift
//  movie-viper
//
//  Created by Irfan Izudin on 01/02/23.
//

import Foundation
import UIKit

class MovieDetailRouter: MovieDetailRouterProtocol {
    static func createMovieDetailModule(movie: Movie) -> MovieDetailViewController {
        let view = MovieDetailViewController()
        let presenter = MovieDetailPresenter()
        let interactor = MovieDetailInteractor()
        let router = MovieDetailRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        interactor.movie = movie
        
        return view
    }
    
    func presentUserReview(movie: Movie, view: UIViewController) {
        
    }
    
    func presentWatchTrailer(movie: Movie, view: UIViewController) {
        
    }
    
    
}
