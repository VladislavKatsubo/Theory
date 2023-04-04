//
//  ArticlesRouter.swift
//  CleanSwiftExample
//
//  Created by Vlad Katsubo on 4.04.23.
//

import UIKit

protocol ArticlesListRoutingLogic {
    func navigateToArticleDetails(article: Article)
}

final class ArticlesListRouter: ArticlesListRoutingLogic {
    weak var viewController: ArticlesListViewController?

    func navigateToArticleDetails(article: Article) {
        let articleDetailsViewController = createArticleDetailsViewController(with: article)
        viewController?.navigationController?.pushViewController(articleDetailsViewController, animated: true)
    }

    private func createArticleDetailsViewController(with article: Article) -> ArticleDetailsViewController {

        let imageService = ImageService()
        let articleDetailsInteractor = ArticleDetailsInteractor(article: article, imageService: imageService)
        let articleDetailsPresenter = ArticleDetailsPresenter()


        let articleDetailsViewController = ArticleDetailsViewController(interactor: articleDetailsInteractor)
        articleDetailsInteractor.presenter = articleDetailsPresenter
        articleDetailsPresenter.viewController = articleDetailsViewController

        return articleDetailsViewController
    }
}
