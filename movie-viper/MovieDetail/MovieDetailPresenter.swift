//
//  MovieDetailPresenter.swift
//  movie-viper
//
//  Created by Irfan Izudin on 01/02/23.
//

import Foundation
import UIKit

class MovieDetailPresenter: MovieDetailPresenterProtocol {
    var view: MovieDetailViewProtocol?
    
    var interactor: MovieDetailInteractorProtocol?
    
    var router: MovieDetailRouterProtocol?
    
    func viewDidLoadMovieDetailById(id: Int) {
        interactor?.getMovieDetailById(id: id)
    }
    
    func interactorDidGetMoviDetailData(result: Result<Movie, Error>) {
        switch result {
        case.success(let movie):
            view?.updateWithData(data: movie)
        case.failure(let error):
            view?.updateWithError(error: error.localizedDescription)
        }
    }
    
    func tapUserReviewButton(movie: Movie, view: UIViewController) {
        router?.presentUserReview(movie: movie, view: view)
    }
    
    func tapWatchTrailerButton(movie: Movie, view: UIViewController) {
        
    }
    
    
}
