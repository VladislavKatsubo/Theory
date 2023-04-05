//
//  ArticlesListInteractor.swift
//  CleanSwiftExample
//
//  Created by Vlad Katsubo on 4.04.23.
//

import Foundation

protocol ArticlesListBusinessLogic: AnyObject {
    func fetchArticles(request: ArticlesList.FetchArticles.Request)
}

class ArticlesListInteractor: ArticlesListBusinessLogic {
    private let presenter: ArticlesListPresentationLogic
    private let newsRepository: NewsRepositoryProtocol

    init(presenter: ArticlesListPresentationLogic, newsRepository: NewsRepositoryProtocol) {
        self.presenter = presenter
        self.newsRepository = newsRepository
    }

    func fetchArticles(request: ArticlesList.FetchArticles.Request) {
        newsRepository.fetchTopHeadlines { result in
            switch result {
            case .success(let articles):
                let response = ArticlesList.FetchArticles.Response(articles: articles)
                self.presenter.presentArticles(response: response)
            case .failure(let error):
                self.presenter.presentError(error)
            }
        }
    }
}
