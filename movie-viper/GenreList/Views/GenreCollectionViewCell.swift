//
//  GenreCollectionViewCell.swift
//  movie-viper
//
//  Created by Irfan Izudin on 31/01/23.
//

import UIKit

class GenreCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "GenreCollectionViewCell"
    
    private let cardView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.cornerRadius = 10
        return view
    }()
    
    let genreTitle: UILabel = {
        let label = UILabel()
        label.text = "Action"
        label.font = .preferredFont(forTextStyle: .headline)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(cardView)
        cardView.addSubview(genreTitle)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        cardView.frame = contentView.bounds
        
        NSLayoutConstraint.activate([
            genreTitle.centerYAnchor.constraint(equalTo: cardView.centerYAnchor),
            genreTitle.centerXAnchor.constraint(equalTo: cardView.centerXAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
