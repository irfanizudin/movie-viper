//
//  MovieDetailTableViewCell.swift
//  movie-viper
//
//  Created by Irfan Izudin on 01/02/23.
//

import UIKit

class MovieDetailTableViewCell: UITableViewCell {

    static let identifier = "MovieDetailTableViewCell"
    
    var titleMovie: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 28)
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var descriptionMovie: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .body)
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var voteAverage: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .callout)
        label.textColor = .white.withAlphaComponent(0.7)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var releaseDate: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .callout)
        label.textColor = .white.withAlphaComponent(0.7)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleMovie)
        contentView.addSubview(descriptionMovie)
        contentView.addSubview(voteAverage)
        contentView.addSubview(releaseDate)
        applyConstraints()
    }
    
    func applyConstraints() {
        NSLayoutConstraint.activate([
            titleMovie.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleMovie.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleMovie.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            descriptionMovie.leadingAnchor.constraint(equalTo: titleMovie.leadingAnchor),
            descriptionMovie.topAnchor.constraint(equalTo: titleMovie.bottomAnchor, constant: 10),
            descriptionMovie.trailingAnchor.constraint(equalTo: titleMovie.trailingAnchor),
            
            voteAverage.leadingAnchor.constraint(equalTo: titleMovie.leadingAnchor),
            voteAverage.topAnchor.constraint(equalTo: descriptionMovie.bottomAnchor, constant: 20),
            voteAverage.trailingAnchor.constraint(equalTo: titleMovie.trailingAnchor),
            
            releaseDate.leadingAnchor.constraint(equalTo: titleMovie.leadingAnchor),
            releaseDate.topAnchor.constraint(equalTo: voteAverage.bottomAnchor, constant: 10),
            releaseDate.trailingAnchor.constraint(equalTo: titleMovie.trailingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
