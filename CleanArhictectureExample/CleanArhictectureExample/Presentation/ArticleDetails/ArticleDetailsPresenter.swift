//
//  ArticleDetailsPresenter.swift
//  CleanArhictectureExample
//
//  Created by Vlad Katsubo on 1.04.23.
//

import UIKit

protocol ArticleDetailsPresenterProtocol: AnyObject {
    func presentArticleDetails(_ article: ArticleDetails)
    func presentImage(_ image: UIImage?)
}

final class ArticleDetailsPresenter: ArticleDetailsPresenterProtocol {
    weak var view: ArticleDetailsViewControllerProtocol?

    func presentArticleDetails(_ article: ArticleDetails) {
        view?.displayTitle(article.title)
        view?.displayDate(formatDate(from: article.publishedAt) ?? "")
        view?.displayDescription(article.description ?? "")
    }

    func presentImage(_ image: UIImage?) {
        if let image = image {
            view?.displayImage(with: image)
        }
    }

    private func formatDate(from dateString: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let date = dateFormatter.date(from: dateString) {
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .none
            return dateFormatter.string(from: date)
        }
        return nil
    }
}
