//
//  MovieReviewInteractor.swift
//  movie-viper
//
//  Created by Irfan Izudin on 01/02/23.
//

import Foundation

class MovieReviewInteractor: MovieReviewInteractorProtocol {
    var presenter: MovieReviewPresenterProtocol?
    
    func getAllReviewById(id: Int, page: Int) {
        guard let url = URL(string: "\(Constants.baseURL)/movie/\(id)/reviews?api_key=\(APIKey.tmdbAPIKey)&language=en-US&page=\(page)") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { [weak self] data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let result = try JSONDecoder().decode(ReviewResponse.self, from: data)
                self?.presenter?.interactorDidGetReviewData(result: .success(result))
            } catch {
                self?.presenter?.interactorDidGetReviewData(result: .failure(error))
            }
        }
        task.resume()
    }
    
    
}
