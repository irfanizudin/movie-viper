//
//  GenreListProtocol.swift
//  movie-viper
//
//  Created by Irfan Izudin on 31/01/23.
//

import Foundation
import UIKit

protocol GenreListViewProtocol {
    var presenter: GenreListPresenterProtocol? { get set }
    func updateWithData(data: [Genre])
    func updateWithError(error: String)
}

protocol GenreListPresenterProtocol {
    var view: GenreListViewProtocol? { get set }
    var interactor: GenreListInteractorProtocol? { get set}
    var router: GenreListRouterProtocol? { get set }
    func viewDidLoadGenreList()
    func interactorDidGetGenreListData(result: Result<[Genre], Error>)
    func tapDiscoverGenre(genre: Genre, view: UIViewController)
}

protocol GenreListInteractorProtocol {
    var presenter: GenreListPresenterProtocol? { get set }
    func getAllGenres()
}

protocol GenreListRouterProtocol {
    static func createGenreListModule() -> GenreListViewController
    func pushToDiscoverGenre(genre: Genre, view: UIViewController)
}
