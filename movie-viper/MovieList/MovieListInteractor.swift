//
//  MovieListInteractor.swift
//  movie-viper
//
//  Created by Irfan Izudin on 31/01/23.
//

import Foundation

class MovieListInteractor: MovieListInteractorProtocol {
    var presenter: MovieListPresenterProtocol?
    
    var genre: Genre?
    
    func getMoviesByGenreId(id: Int, page: Int) {
        guard let url = URL(string: "\(Constants.baseURL)/discover/movie?api_key=\(APIKey.tmdbAPIKey)&language=en-US&sort_by=popularity.desc&include_video=false&page=\(page)&with_genres=\(id)") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { [weak self] data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let result = try JSONDecoder().decode(MovieResponse.self, from: data)
                self?.presenter?.interactorDidGetMovieListData(result: .success(result))
            } catch {
                self?.presenter?.interactorDidGetMovieListData(result: .failure(error))
            }
        }
        task.resume()
    }
    
    
}
