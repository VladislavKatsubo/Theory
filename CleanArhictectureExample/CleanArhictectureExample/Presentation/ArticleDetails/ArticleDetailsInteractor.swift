//
//  ArticleDetailsInteractor.swift
//  CleanArhictectureExample
//
//  Created by Vlad Katsubo on 1.04.23.
//

import UIKit

protocol ArticleDetailsInteractorProtocol {
    func fetchArticleDetails()
}

final class ArticleDetailsInteractor: ArticleDetailsInteractorProtocol {
    private let article: Article
    private let presenter: ArticleDetailsPresenterProtocol
    private let imageService: ImageServiceProtocol?

    init(article: Article, presenter: ArticleDetailsPresenterProtocol, imageService: ImageServiceProtocol) {
        self.article = article
        self.presenter = presenter
        self.imageService = imageService
    }

    func fetchArticleDetails() {
        let articleDetails = getArticleDetails(from: article)
        presenter.presentArticleDetails(articleDetails)
        loadImage(from: articleDetails.urlToImage)
    }

    func loadImage(from urlString: String?) {
        imageService?.loadImage(from: urlString) { [weak self] image in
            self?.presenter.presentImage(image)
        }
    }

    func getArticleDetails(from article: Article) -> ArticleDetails {
        return ArticleDetails(
            title: article.title,
            description: article.description,
            publishedAt: article.publishedAt,
            urlToImage: article.urlToImage
        )
    }
}
