//
//  MovieDetailView.swift
//  movie-viper
//
//  Created by Irfan Izudin on 01/02/23.
//

import Foundation
import UIKit

class MovieDetailViewController: UIViewController, MovieDetailViewProtocol {
    var presenter: MovieDetailPresenterProtocol?
    var id: Int = 0
    var movie: Movie?
    var headerView: HeaderTableView?
    
    private let movieDetailTableView: UITableView = {
        let table = UITableView()
        table.register(MovieDetailTableViewCell.self, forCellReuseIdentifier: MovieDetailTableViewCell.identifier)
        table.isHidden = true
        return table
    }()
    
    private let loadingIndicator: UIActivityIndicatorView = {
        let loading = UIActivityIndicatorView(style: .large)
        loading.startAnimating()
        return loading
    }()
    
    func updateWithData(data: Movie) {
        DispatchQueue.main.async { [weak self] in
            self?.movie = data
            self?.loadingIndicator.stopAnimating()
            self?.loadingIndicator.isHidden = true
            self?.movieDetailTableView.isHidden = false
            self?.movieDetailTableView.reloadData()
        }
    }
    
    func updateWithError(error: String) {
        print(error)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationItem.largeTitleDisplayMode = .never
        
        view.addSubview(movieDetailTableView)
        view.addSubview(loadingIndicator)
        
        headerView = HeaderTableView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 400))
        movieDetailTableView.tableHeaderView = headerView
        
        movieDetailTableView.delegate = self
        movieDetailTableView.dataSource = self
        presenter?.viewDidLoadMovieDetailById(id: id)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        movieDetailTableView.frame = view.bounds
        loadingIndicator.frame = view.bounds
    }
}

extension MovieDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieDetailTableViewCell.identifier, for: indexPath) as? MovieDetailTableViewCell else {
            return UITableViewCell()
        }
        headerView?.configurePosterImage(url: movie?.poster_path ?? "")
        cell.titleMovie.text = movie?.title ?? movie?.original_title
        cell.descriptionMovie.text = movie?.overview
        cell.voteAverage.text = "Rating: \(Double(round(10 * (movie?.vote_average ?? 0)) / 10) )/10"
        cell.releaseDate.text = "Release Date: \(movie?.release_date ?? "xxxx-xx-xx")"
        return cell
    }
}
