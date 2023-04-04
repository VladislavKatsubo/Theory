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

class ArticlesListInteractor {
    private let apiService: APIServiceProtocol
    private let presenter: ArticlesListPresentationLogic

    init(presenter: ArticlesListPresentationLogic, apiService: APIServiceProtocol) {
        self.presenter = presenter
        self.apiService = apiService
    }
}

extension ArticlesListInteractor: ArticlesListBusinessLogic {
    func fetchArticles(request: ArticlesList.FetchArticles.Request) {
        apiService.fetchTopHeadlines { [weak self] result in
            switch result {
            case .success(let response):
                let response = ArticlesList.FetchArticles.Response(articles: response)
                self?.presenter.presentArticles(response: response)
            case .failure(let error):
                self?.presenter.presentError(error)
            }
        }
    }
}
