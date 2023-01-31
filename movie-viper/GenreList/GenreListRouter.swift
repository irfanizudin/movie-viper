//
//  GenreListRouter.swift
//  movie-viper
//
//  Created by Irfan Izudin on 31/01/23.
//

import Foundation
import UIKit

class GenreListRouter: GenreListRouterProtocol {
    static func createGenreListModule() -> GenreListViewController {
        let view = GenreListViewController()
        let presenter = GenreListPresenter()
        let interactor = GenreListInteractor()
        let router = GenreListRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        return view
    }
    
    func pushToDiscoverGenre(genre: Genre, view: UIViewController) {
        
    }
    
    
}
