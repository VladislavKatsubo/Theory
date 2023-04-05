//
//  NewsRepository.swift
//  CleanSwiftExample
//
//  Created by Vlad Katsubo on 5.04.23.
//

import Foundation

protocol NewsRepositoryProtocol {
    func fetchTopHeadlines(completion: @escaping (Result<[Article], Error>) -> Void)
}

class NewsRepository: NewsRepositoryProtocol {
    private let apiService: APIService

    init(apiService: APIService) {
        self.apiService = apiService
    }

    func fetchTopHeadlines(completion: @escaping (Result<[Article], Error>) -> Void) {
        apiService.fetchTopHeadlines { result in
            completion(result)
        }
    }
}
