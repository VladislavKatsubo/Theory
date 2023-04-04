//
//  ArticlesListPresenter.swift
//  CleanSwiftExample
//
//  Created by Vlad Katsubo on 4.04.23.
//

import Foundation

protocol ArticlesListPresentationLogic: AnyObject {
    func presentArticles(response: ArticlesList.FetchArticles.Response)
    func presentError(_ error: Error)
}

class ArticlesListPresenter {
    private weak var viewController: ArticlesListDisplayLogic?

    func configure(with viewController: ArticlesListDisplayLogic) {
        self.viewController = viewController
    }
}

extension ArticlesListPresenter: ArticlesListPresentationLogic {
    func presentArticles(response: ArticlesList.FetchArticles.Response) {
        let articles = response.articles.map { article -> ArticlesList.FetchArticles.ViewModel.ArticlesListViewModel in
            return ArticlesList.FetchArticles.ViewModel.ArticlesListViewModel(title: article.title, article: article)
        }

        let viewModels = ArticlesList.FetchArticles.ViewModel(articlesToDisplay: articles)

        viewController?.displayArticles(viewModel: viewModels)
    }
    func presentError(_ error: Error) {
        let errorMessage = "An error occurred: \(error.localizedDescription)"
        viewController?.displayError(viewModel: ArticlesList.Error.ViewModel(error: errorMessage))
    }
}
