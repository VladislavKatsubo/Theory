//
//  ArticleDetailsInteractor.swift
//  CleanSwiftExample
//
//  Created by Vlad Katsubo on 4.04.23.
//

import Foundation

protocol ArticleDetailsBusinessLogic {
    func loadArticle(request: ArticleDetails.FetchArticleDetails.Request)
}

final class ArticleDetailsInteractor: ArticleDetailsBusinessLogic {
    var presenter: ArticleDetailsPresentationLogic?

    private let imageService: ImageServiceProtocol

    private let article: Article

    init(article: Article, imageService: ImageServiceProtocol) {
        self.article = article
        self.imageService = imageService
    }

    func loadArticle(request: ArticleDetails.FetchArticleDetails.Request) {
        let response = ArticleDetails.FetchArticleDetails.Response(article: article)
        presenter?.presentArticle(response: response)
        self.fetchImage()
    }
}

private extension ArticleDetailsInteractor {
    func fetchImage() {
        imageService.loadImage(from: article.urlToImage) { [weak self] image in
            DispatchQueue.main.async {
                self?.presenter?.presentImage(image)
            }
        }
    }
}
