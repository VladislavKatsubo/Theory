//
//  ArticleDetails.swift
//  CleanSwiftExample
//
//  Created by Vlad Katsubo on 4.04.23.
//

import Foundation

enum ArticleDetails {
    enum FetchArticleDetails {
        struct Request {
        }

        struct Response {
            let article: Article
        }

        struct ViewModel {
            struct ArticleDetailsViewModel {
                let title: String?
                let image: URL?
                let formattedDate: String?
                let description: String?
            }
            let articleToDisplay: ArticleDetailsViewModel
        }
    }

    enum Error {
        struct ViewModel {
            let error: String
        }
    }
}
