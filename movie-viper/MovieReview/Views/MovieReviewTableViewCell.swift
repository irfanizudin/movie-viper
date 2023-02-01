//
//  MovieReviewTableViewCell.swift
//  movie-viper
//
//  Created by Irfan Izudin on 01/02/23.
//

import UIKit
import SDWebImage

class MovieReviewTableViewCell: UITableViewCell {
    
    static let identifier = "MovieReviewTableViewCell"

    var avatar: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.backgroundColor = .gray.withAlphaComponent(0.7)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var author: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = UIColor.white
        label.text = "avatar"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var contentText: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .body)
        label.textColor = UIColor.white
        label.numberOfLines = 0
        label.text = "lorem mfkdsmfkmdksmkfls fndksfnsjkdf fkdsfmdsk rirjiowrew rnewrnwekrwe jrwkljrwklre jrwklejrklew wqewqewqe emwqkemwqkleq ewqmeklqmelkqmewq meklmqwelkqw oioio"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var writtenDate: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .footnote)
        label.textColor = UIColor.white.withAlphaComponent(0.7)
        label.text = "Written on 2023-08-18"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var rating: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .footnote)
        label.textColor = UIColor.white.withAlphaComponent(0.7)
        label.text = "8.5/10"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        [avatar, author, contentText, writtenDate, rating].forEach { view in
            contentView.addSubview(view)
        }
        contentView.addSubview(avatar)
        applyConstraints()
    }
    
    func applyConstraints() {
        NSLayoutConstraint.activate([
            avatar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            avatar.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            avatar.widthAnchor.constraint(equalToConstant: 40),
            avatar.heightAnchor.constraint(equalToConstant: 40),
            
            author.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 10),
            author.topAnchor.constraint(equalTo: avatar.topAnchor),
            author.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            rating.leadingAnchor.constraint(equalTo: author.leadingAnchor),
            rating.topAnchor.constraint(equalTo: author.bottomAnchor, constant: 5),
            
            writtenDate.leadingAnchor.constraint(equalTo: author.leadingAnchor),
            writtenDate.topAnchor.constraint(equalTo: rating.bottomAnchor, constant: 5),
            
            contentText.leadingAnchor.constraint(equalTo: author.leadingAnchor),
            contentText.topAnchor.constraint(equalTo: writtenDate.bottomAnchor, constant: 10),
            contentText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            contentText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
    
        ])
    }
    
    func configureAvatar(url: String) {
        let trimURL = String(url.dropFirst())
        guard let url = URL(string: trimURL) else { return }
        avatar.sd_imageIndicator = SDWebImageActivityIndicator()
        avatar.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder"))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
