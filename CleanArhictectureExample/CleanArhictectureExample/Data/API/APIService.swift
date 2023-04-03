//
//  APIService.swift
//  CleanArhictectureExample
//
//  Created by Vlad Katsubo on 1.04.23.
//

import Foundation

protocol APIServiceProtocol {
    func fetch<T: Codable>(endpoint: String, completion: @escaping (Result<T, Error>) -> Void)
}

enum APIError: Error {
    case invalidURL
    case noData
    case decodingError
}

class APIService: APIServiceProtocol {
    private let apiKey = "46448ce02aab413fb8a692b732bfe30f"
    private let baseURL = "https://newsapi.org/v2/"

    func fetch<T: Codable>(endpoint: String, completion: @escaping (Result<T, Error>) -> Void) {
        // Ensure the URL is valid
        guard let url = URL(string: "\(baseURL)\(endpoint)&apiKey=\(apiKey)") else {
            completion(.failure(APIError.invalidURL))
            return
        }

        // Create a URLSession data task to fetch the data
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            // Handle networking errors
            if let error = error {
                completion(.failure(error))
                return
            }

            // Ensure there's data in the response
            guard let data = data else {
                completion(.failure(APIError.noData))
                return
            }

            // Decode the JSON data into the specified Codable type
            let decoder = JSONDecoder()
            do {
                let decodedData = try decoder.decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(APIError.decodingError))
            }
        }

        // Start the data task
        task.resume()
    }
}
