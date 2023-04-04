//
//  APIConfiguration.swift
//  CleanSwiftExample
//
//  Created by Vlad Katsubo on 4.04.23.
//

struct APIConfiguration {
    let baseURL: String
    let topHeadlinesEndpoint: String
    let apiKey: String

    static let defaultConfiguration = APIConfiguration(
        baseURL: "https://newsapi.org/v2/",
        topHeadlinesEndpoint: "top-headlines?country=us",
        apiKey: "&apiKey=46448ce02aab413fb8a692b732bfe30f"
    )
}
