//
//  MovieListView.swift
//  movie-viper
//
//  Created by Irfan Izudin on 31/01/23.
//

import Foundation
import UIKit

class MovieListViewController: UIViewController, MovieListViewProtocol {
    var presenter: MovieListPresenterProtocol?
    var genreId: Int?
    var movies: [Movie] = []
    
    private let movieListCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 3 - 10, height: 200)
        layout.minimumInteritemSpacing = 0
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
        return collection
    }()
    
    func updateWithData(data: [Movie]) {
        DispatchQueue.main.async { [weak self] in
            self?.movies = data
            self?.movieListCollectionView.reloadData()
        }
    }
    
    func updateWithError(error: String) {
        print(error)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .never
        
        
        view.addSubview(movieListCollectionView)
        movieListCollectionView.delegate = self
        movieListCollectionView.dataSource = self
        
        guard let genreId = genreId else { return }
        presenter?.viewDidLoadMovieListWithGenreId(id: genreId)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        movieListCollectionView.frame = view.bounds
    }
}

extension MovieListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as? MovieCollectionViewCell else {
            return UICollectionViewCell()
        }
        let movie = movies[indexPath.row]
        
        cell.configurePoster(url: movie.poster_path ?? "")
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        return cell
    }
}
