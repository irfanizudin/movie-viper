//
//  HeaderTableView.swift
//  movie-viper
//
//  Created by Irfan Izudin on 01/02/23.
//

import UIKit
import SDWebImage

class HeaderTableView: UIView {
    
    var posterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.backgroundColor = .red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var reviewButton: UIButton = {
        let button = UIButton()
        button.setTitle("See Reviews", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.gray
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var trailerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Watch Trailer", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.red
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(posterImage)
        addSubview(reviewButton)
        addSubview(trailerButton)
        applyConstraints()
    }
    
    func applyConstraints() {
        NSLayoutConstraint.activate([
            posterImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            posterImage.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            posterImage.heightAnchor.constraint(equalToConstant: 300),
            posterImage.widthAnchor.constraint(equalToConstant: 200),
            
            trailerButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            trailerButton.topAnchor.constraint(equalTo: posterImage.bottomAnchor, constant: 10),
            trailerButton.heightAnchor.constraint(equalToConstant: 45),
            trailerButton.widthAnchor.constraint(equalToConstant: 140),
            
            reviewButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            reviewButton.topAnchor.constraint(equalTo: trailerButton.topAnchor),
            reviewButton.heightAnchor.constraint(equalToConstant: 45),
            reviewButton.widthAnchor.constraint(equalToConstant: 140),

            
        ])
    }
    
    func configurePosterImage(url: String) {
        guard let url = URL(string: "\(Constants.baseImageURL)\(url)") else { return }
        posterImage.sd_imageIndicator = SDWebImageActivityIndicator()
        posterImage.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder"))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
