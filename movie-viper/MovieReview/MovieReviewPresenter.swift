//
//  MovieReviewPresenter.swift
//  movie-viper
//
//  Created by Irfan Izudin on 01/02/23.
//

import Foundation

class MovieReviewPresenter: MovieReviewPresenterProtocol {
    var view: MovieReviewViewProtocol?
    
    var interactor: MovieReviewInteractorProtocol?
    
    var router: MovieReviewRouterProtocol?
    
    func viewDidLoadReviewById(id: Int, page: Int) {
        interactor?.getAllReviewById(id: id, page: page)
    }
    
    func interactorDidGetReviewData(result: Result<ReviewResponse, Error>) {
        switch result {
        case.success(let reviewResponse):
            view?.updateWithData(data: reviewResponse)
        case.failure(let error):
            view?.updateWithError(error: error.localizedDescription)
        }
    }
    
    
}
