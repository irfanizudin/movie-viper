//
//  MovieDetailInteractor.swift
//  movie-viper
//
//  Created by Irfan Izudin on 01/02/23.
//

import Foundation

class MovieDetailInteractor: MovieDetailInteractorProtocol {
    var presenter: MovieDetailPresenterProtocol?
    
    var movie: Movie?
    
    func getMovieDetailById(id: Int) {
        guard let url = URL(string: "\(Constants.baseURL)/movie/\(id)?api_key=\(APIKey.tmdbAPIKey)&language=en-US") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { [weak self] data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let result = try JSONDecoder().decode(Movie.self, from: data)
                self?.presenter?.interactorDidGetMoviDetailData(result: .success(result))
            } catch {
                self?.presenter?.interactorDidGetMoviDetailData(result: .failure(error))
            }
        }
        task.resume()
    }
    
    
}
