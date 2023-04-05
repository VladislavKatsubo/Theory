//
//  ArticleDetailsPresenter.swift
//  CleanSwiftExample
//
//  Created by Vlad Katsubo on 4.04.23.
//

import UIKit

protocol ArticleDetailsPresentationLogic {
    func presentArticle(response: ArticleDetails.FetchArticleDetails.Response)
    func presentImage(_ image: UIImage?)
}

final class ArticleDetailsPresenter: ArticleDetailsPresentationLogic {

    weak var viewController: ArticleDetailsDisplayLogic?

    func presentArticle(response: ArticleDetails.FetchArticleDetails.Response) {
        let imageUrl = URL(string: response.article.urlToImage ?? "")
        let date = formatDate(from: response.article.publishedAt)
        let viewModel = ArticleDetails.FetchArticleDetails.ViewModel(
            articleToDisplay:
                ArticleDetails.FetchArticleDetails.ViewModel.ArticleDetailsViewModel(
                    title: response.article.title,
                    image: imageUrl,
                    formattedDate: date,
                    description: response.article.description
                )
        )
        viewController?.displayArticle(with: viewModel)
    }

    func presentImage(_ image: UIImage?) {
        viewController?.displayImage(with: image)
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
