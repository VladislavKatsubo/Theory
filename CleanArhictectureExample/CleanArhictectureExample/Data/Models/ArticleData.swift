//
//  ArticleData.swift
//  CleanArhictectureExample
//
//  Created by Vlad Katsubo on 1.04.23.
//

import Foundation

struct NewsAPIResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [ArticleDTO]
}

struct ArticleDTO: Codable {
    let source: SourceDTO
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?
}

struct SourceDTO: Codable {
    let id: String?
    let name: String
}
