//
//  GenreListView.swift
//  movie-viper
//
//  Created by Irfan Izudin on 31/01/23.
//

import Foundation
import UIKit

class GenreListViewController: UIViewController, GenreListViewProtocol {
    
    var genres: [Genre] = []
    var presenter: GenreListPresenterProtocol?
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2 - 10, height: 100)
        layout.minimumInteritemSpacing = 0
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(GenreCollectionViewCell.self, forCellWithReuseIdentifier: GenreCollectionViewCell.identifier)
        return collection
    }()
    
    func updateWithData(data: [Genre]) {
        DispatchQueue.main.async { [weak self] in
            self?.genres = data
            self?.collectionView.reloadData()
        }
    }
    
    func updateWithError(error: String) {
        print(error)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Movie Genres"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        presenter?.viewDidLoadGenreList()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
}

extension GenreListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return genres.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GenreCollectionViewCell.identifier, for: indexPath) as? GenreCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.genreTitle.text = genres[indexPath.row].name
        return cell
    }
}
