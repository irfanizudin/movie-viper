//
//  GenreListInteractor.swift
//  movie-viper
//
//  Created by Irfan Izudin on 31/01/23.
//

import Foundation

class GenreListInteractor: GenreListInteractorProtocol {
    var presenter: GenreListPresenterProtocol?
    
    func getAllGenres() {
        guard let url = URL(string: "\(Constants.baseURL)/genre/movie/list?api_key=\(APIKey.tmdbAPIKey)&language=en-US") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                self?.presenter?.interactorDidGetGenreListData(result: .failure(error!))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(GenreResponse.self, from: data)
                self?.presenter?.interactorDidGetGenreListData(result: .success(result.genres ?? []))
            } catch {
                self?.presenter?.interactorDidGetGenreListData(result: .failure(error))
            }
        }
        task.resume()
    }
    
    
}
