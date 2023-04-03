//
//  ArticlesListRouter.swift
//  CleanArhictectureExample
//
//  Created by Vlad Katsubo on 1.04.23.
//

import UIKit

protocol ArticlesListRouterProtocol {
    func navigateToArticleDetail(article: Article)
}

class ArticlesListRouter: ArticlesListRouterProtocol {
    weak var viewController: UIViewController?
    private var articleDetailsFactory: ArticleDetailsFactoryProtocol

    init(articleDetailsFactory: ArticleDetailsFactoryProtocol) {
        self.articleDetailsFactory = articleDetailsFactory
    }

    func navigateToArticleDetail(article: Article) {
        // Instantiate ArticleDetailViewController and set its properties
        let articleDetailViewController = articleDetailsFactory.makeArticleDetailsModule(article: article)
        viewController?.navigationController?.pushViewController(articleDetailViewController, animated: true)
    }
}
