//
//  MovieTrailerPresenter.swift
//  movie-viper
//
//  Created by Irfan Izudin on 01/02/23.
//

import Foundation

class MovieTrailerPresenter: MovieTrailerPresenterProtocol {
    
    var view: MovieTrailerViewProtocol?
    
    var interactor: MovieTrailerInteractorProtocol?
    
    var router: MovieTrailerRouterProtocol?
    
    func viewDidLoadYoutubeVideo(query: String) {
        interactor?.getYoutubeVideoByQuery(query: "\(query) trailer")
    }
       
    func interactorDidGetYoutubeVideo(result: Result<String, Error>) {
        switch result {
        case.success(let videoId):
            view?.updateWithData(videoId: videoId)
        case.failure(let error):
            view?.updateWithError(error: error.localizedDescription)
        }
    }

    
}
