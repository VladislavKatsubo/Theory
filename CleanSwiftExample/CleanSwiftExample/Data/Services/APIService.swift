//
//  APIService.swift
//  CleanSwiftExample
//
//  Created by Vlad Katsubo on 4.04.23.
//

import Foundation

protocol APIServiceProtocol {
    func fetchTopHeadlines(completion: @escaping (Result<[Article], Error>) -> Void)
}

final class APIService: APIServiceProtocol {
    private let configuration: APIConfiguration

    init(configuration: APIConfiguration = .defaultConfiguration) {
        self.configuration = configuration
    }

    func fetchTopHeadlines(completion: @escaping (Result<[Article], Error>) -> Void) {
        let urlString = configuration.baseURL + configuration.topHeadlinesEndpoint + configuration.apiKey

        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 400, userInfo: nil)))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: 404, userInfo: nil)))
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let response = try decoder.decode(ArticlesResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(response.articles))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }

        task.resume()
    }
}
