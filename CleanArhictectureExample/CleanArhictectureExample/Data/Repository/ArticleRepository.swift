//
//  ArticleRepository.swift
//  CleanArhictectureExample
//
//  Created by Vlad Katsubo on 1.04.23.
//

import Foundation

protocol ArticleRepository {
    func fetchTopHeadlines(completion: @escaping (Result<[Article], Error>) -> Void)
}

class ArticleRepositoryImpl: ArticleRepository {
    private let apiService: APIServiceProtocol

    init(apiService: APIServiceProtocol) {
        self.apiService = apiService
    }

    func fetchTopHeadlines(completion: @escaping (Result<[Article], Error>) -> Void) {
        let endpoint = "top-headlines?country=us"

        apiService.fetch(endpoint: endpoint) { (result: Result<NewsAPIResponse, Error>) in
            switch result {
            case .success(let newsAPIResponse):
                let articles = newsAPIResponse.articles.map { Article(dto: $0) }
                completion(.success(articles))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
