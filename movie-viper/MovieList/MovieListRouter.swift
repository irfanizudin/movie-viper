//
//  MovieListRouter.swift
//  movie-viper
//
//  Created by Irfan Izudin on 31/01/23.
//

import Foundation
import UIKit

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
//        interactor.genre = genre
        
        return view
    }
    
    func pushToMovieDetail(movie: Movie, view: UIViewController) {
        let movieDetailVC = MovieDetailRouter.createMovieDetailModule(movie: movie)
        movieDetailVC.id = movie.id ?? 0
        view.navigationController?.pushViewController(movieDetailVC, animated: true)
    }

    
}
