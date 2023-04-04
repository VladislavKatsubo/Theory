//
//  Article.swift
//  CleanSwiftExample
//
//  Created by Vlad Katsubo on 4.04.23.
//

struct Article: Codable {
    let title: String
    let description: String?
    let urlToImage: String?
    let publishedAt: String
}
