//
//  MovieReviewProtocol.swift
//  movie-viper
//
//  Created by Irfan Izudin on 01/02/23.
//

import Foundation

protocol MovieReviewViewProtocol {
    var presenter: MovieReviewPresenterProtocol? { get set }
    func updateWithData(data: ReviewResponse)
    func updateWithError(error: String)
}

protocol MovieReviewPresenterProtocol {
    var view: MovieReviewViewProtocol? { get set }
    var interactor: MovieReviewInteractorProtocol? { get set }
    var router: MovieReviewRouterProtocol? { get set }
    func viewDidLoadReviewById(id: Int, page: Int)
    func interactorDidGetReviewData(result: Result<ReviewResponse, Error>)
}

protocol MovieReviewInteractorProtocol {
    var presenter: MovieReviewPresenterProtocol? { get set }
    func getAllReviewById(id: Int, page: Int)
}

protocol MovieReviewRouterProtocol {
    static func createMovieReviewModule(movie: Movie) -> MovieReviewViewController
}
