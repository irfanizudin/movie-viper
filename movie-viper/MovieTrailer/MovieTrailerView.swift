//
//  MovieTrailerView.swift
//  movie-viper
//
//  Created by Irfan Izudin on 01/02/23.
//

import Foundation
import UIKit
import WebKit

class MovieTrailerViewController: UIViewController, MovieTrailerViewProtocol {
    var presenter: MovieTrailerPresenterProtocol?
    var query: String = ""
    var IsTrailerFinishLoaded: Bool = false
    
    private let webPlayerUIView: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = .gray
        uiView.translatesAutoresizingMaskIntoConstraints = false
        return uiView
    }()
    
    private var webView: WKWebView = {
        let config = WKWebViewConfiguration()
        config.allowsInlineMediaPlayback = true
        config.mediaTypesRequiringUserActionForPlayback = .audio
        let webView = WKWebView(frame: .zero, configuration: config)
        webView.isHidden = true
        return webView
    }()
    
    private let loadingIndicator: UIActivityIndicatorView = {
        let loading = UIActivityIndicatorView(style: .large)
        loading.startAnimating()
        return loading
    }()
 
    func updateWithData(videoId: String) {
        if let url = URL(string: "https://www.youtube.com/embed/\(videoId)?autoplay=1") {
            DispatchQueue.main.async { [weak self] in
                self?.webView.load(URLRequest(url: url))
            }
        } else {
            print("url nil")
        }

    }
    
    func updateWithError(error: String) {
        print(error)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        configureNavbar()
        
        view.addSubview(webPlayerUIView)
        webPlayerUIView.addSubview(webView)
        webPlayerUIView.addSubview(loadingIndicator)
        webView.navigationDelegate = self

        applyConstraints()
        
        presenter?.viewDidLoadYoutubeVideo(query: query)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = webPlayerUIView.bounds
        loadingIndicator.frame = webPlayerUIView.frame
    }
    
    func applyConstraints() {
        NSLayoutConstraint.activate([
            webPlayerUIView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webPlayerUIView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            webPlayerUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webPlayerUIView.heightAnchor.constraint(equalToConstant: 250),
            webPlayerUIView.widthAnchor.constraint(equalToConstant: view.bounds.width),

        ])
    }
    
    func configureNavbar() {
        title = "Movie Trailer"
        navigationController?.navigationBar.tintColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark.circle"), style: .done, target: self, action: #selector(dismissModal))
    }
    
    @objc func dismissModal() {
        dismiss(animated: true)
    }


}

extension MovieTrailerViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("finish loaded")
        IsTrailerFinishLoaded = true
        loadingIndicator.stopAnimating()
        loadingIndicator.isHidden = true
        webView.isHidden = false
    }
}
