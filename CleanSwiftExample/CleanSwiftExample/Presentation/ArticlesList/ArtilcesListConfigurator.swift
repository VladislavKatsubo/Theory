//
//  ArtilcesListConfigurator.swift
//  CleanSwiftExample
//
//  Created by Vlad Katsubo on 4.04.23.
//

import Foundation

class ArticlesListConfigurator {
    static func createArticlesListViewController() -> ArticlesListViewController {
        let apiService = APIService()
        let newsRepository = NewsRepository(apiService: apiService)
        let articlesListRouter = ArticlesListRouter()
        let articlesListPresenter = ArticlesListPresenter()
        let articlesListInteractor = ArticlesListInteractor(presenter: articlesListPresenter, newsRepository: newsRepository)
        let articlesListViewController = ArticlesListViewController(interactor: articlesListInteractor, router: articlesListRouter)

        articlesListPresenter.configure(with: articlesListViewController)
        articlesListRouter.viewController = articlesListViewController

        return articlesListViewController
    }
}
