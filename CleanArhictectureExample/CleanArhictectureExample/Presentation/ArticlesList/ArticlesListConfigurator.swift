//
//  ArticlesListConfigurator.swift
//  CleanArhictectureExample
//
//  Created by Vlad Katsubo on 2.04.23.
//

import UIKit

class ArticlesListConfigurator {
    func configure() -> UIViewController {

        let apiService = APIService()
        let articleRepository = ArticleRepositoryImpl(apiService: apiService)
        let articleDetailsFactory = ArticleDetailsFactory()

        let presenter = ArticlesListPresenter()
        let interactor = ArticlesListInteractorImpl(articleRepository: articleRepository, presenter: presenter)
        let router = ArticlesListRouter(articleDetailsFactory: articleDetailsFactory)
        let viewController = ArticlesListViewController(interactor: interactor, router: router)
        presenter.configure(with: viewController)
        router.viewController = viewController

        return viewController
    }
}
