//
//  Article.swift
//  CleanArhictectureExample
//
//  Created by Vlad Katsubo on 1.04.23.
//

import Foundation

struct Article {
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?
}

struct Source {
    let id: String?
    let name: String
}

extension Article {
    init(dto: ArticleDTO) {
        self.source = Source(id: dto.source.id, name: dto.source.name)
        self.author = dto.author
        self.title = dto.title
        self.description = dto.description
        self.url = dto.url
        self.urlToImage = dto.urlToImage
        self.publishedAt = dto.publishedAt
        self.content = dto.content
    }
}
