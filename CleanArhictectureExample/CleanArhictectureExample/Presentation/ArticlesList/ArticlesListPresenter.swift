//
//  ArticlesListPresenter.swift
//  CleanArhictectureExample
//
//  Created by Vlad Katsubo on 1.04.23.
//

import Foundation

protocol ArticlesListPresenterProtocol {
    func presentArticles(articles: [Article])
    func presentError(error: Error)
}

final class ArticlesListPresenter: ArticlesListPresenterProtocol {
    private weak var viewController: ArticlesListViewControllerProtocol?

    func configure(with viewController: ArticlesListViewControllerProtocol) {
        self.viewController = viewController
    }

    func presentArticles(articles: [Article]) {
        viewController?.displayArticles(articles: articles)
    }

    func presentError(error: Error) {
        viewController?.displayError(error: error)
    }
}
