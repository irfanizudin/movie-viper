//
//  MovieReviewView.swift
//  movie-viper
//
//  Created by Irfan Izudin on 01/02/23.
//

import Foundation
import UIKit

class MovieReviewViewController: UIViewController, MovieReviewViewProtocol {
    var presenter: MovieReviewPresenterProtocol?
    
    var id: Int = 0
    var page: Int = 1
    var totalPages: Int = 0
    var isCollapse: Bool = true
    var selectedCell: Int = -1
    var reviews: [Review] = []
    
    private let reviewTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(MovieReviewTableViewCell.self, forCellReuseIdentifier: MovieReviewTableViewCell.identifier)
        return tableView
    }()
    
    private let emptyLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 30)
        label.textColor = .white.withAlphaComponent(0.5)
        label.text = "Not Reviewed Yet"
        label.isHidden = true
        label.textAlignment = .center
        return label
    }()
    
    func updateWithData(data: ReviewResponse) {
        DispatchQueue.main.async { [weak self] in
            self?.reviews.append(contentsOf: data.results ?? [])
            guard let reviews = self?.reviews else { return }
            if reviews.isEmpty {
                self?.emptyLabel.isHidden = false
            }
            self?.totalPages = data.total_pages ?? 0
            self?.reviewTableView.reloadData()
        }
    }
    
    func updateWithError(error: String) {
        print(error)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        configureNavbar()
        view.addSubview(reviewTableView)
        view.addSubview(emptyLabel)
        reviewTableView.delegate = self
        reviewTableView.dataSource = self
        presenter?.viewDidLoadReviewById(id: id, page: page)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        reviewTableView.frame = view.bounds
        emptyLabel.frame = view.bounds
        emptyLabel.center = view.center
    
    }
        
    func configureNavbar() {
        title = "Reviews"
        navigationController?.navigationBar.tintColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark.circle"), style: .done, target: self, action: #selector(dismissModal))
    }
    
    @objc func dismissModal() {
        dismiss(animated: true)
    }
    
}

extension MovieReviewViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieReviewTableViewCell.identifier, for: indexPath) as? MovieReviewTableViewCell else {
            return UITableViewCell()
        }
        let review = reviews[indexPath.row]
        
        cell.configureAvatar(url: review.author_details?.avatar_path ?? "")
        cell.author.text = review.author
        if review.author_details?.rating == nil {
            cell.rating.text = "Not rated yet"
        } else {
            cell.rating.text = "\(Double(round(10 * (review.author_details?.rating ?? 0)) / 10) )/10.0"
        }
        cell.writtenDate.text = "Written on \(review.updated_at ?? "xxxx-xx-xx")"
        cell.contentText.text = review.content
        if isCollapse {
            cell.contentText.numberOfLines = 4
        } else {
            cell.contentText.numberOfLines = 0
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if selectedCell == indexPath.row && !isCollapse {
            return UITableView.automaticDimension
        } else {
            return 200
        }
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedCell = indexPath.row
        isCollapse = !isCollapse
        tableView.reloadRows(at: [indexPath], with: .automatic)
        
    }
}
