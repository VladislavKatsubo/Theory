//
//  ArticlesListInteractor.swift
//  CleanArhictectureExample
//
//  Created by Vlad Katsubo on 1.04.23.
//

import Foundation

protocol ArticlesListInteractor {
    func fetchTopHeadlines()
}

class ArticlesListInteractorImpl: ArticlesListInteractor {
    private let articleRepository: ArticleRepository
    private let presenter: ArticlesListPresenterProtocol

    init(articleRepository: ArticleRepository, presenter: ArticlesListPresenterProtocol) {
        self.articleRepository = articleRepository
        self.presenter = presenter
    }

    func fetchTopHeadlines() {
        articleRepository.fetchTopHeadlines { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let articles):
                    self?.presenter.presentArticles(articles: articles)
                case .failure(let error):
                    self?.presenter.presentError(error: error)
                }
            }
        }
    }
}

