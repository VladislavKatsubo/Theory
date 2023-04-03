//
//  ArticleDetailsFactory.swift
//  CleanArhictectureExample
//
//  Created by Vlad Katsubo on 2.04.23.
//

import UIKit

protocol ArticleDetailsFactoryProtocol: AnyObject {
    func makeArticleDetailsModule(article: Article) -> UIViewController
}

class ArticleDetailsFactory: ArticleDetailsFactoryProtocol {
    func makeArticleDetailsModule(article: Article) -> UIViewController {
        let imageService = ImageService()
        let presenter = ArticleDetailsPresenter()
        let interactor = ArticleDetailsInteractor(article: article, presenter: presenter, imageService: imageService)
        let viewController = ArticleDetailsViewController(interactor: interactor)
        presenter.view = viewController
        return viewController
    }
}
