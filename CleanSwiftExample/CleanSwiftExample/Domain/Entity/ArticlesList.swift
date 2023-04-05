//
//  ArticlesList.swift
//  CleanSwiftExample
//
//  Created by Vlad Katsubo on 4.04.23.
//

import Foundation

enum ArticlesList {
    enum FetchArticles {
        struct Request {
        }

        struct Response {
            var articles: [Article]
        }

        struct ViewModel {
            struct ArticlesListViewModel {
                let title: String
                let article: Article
            }
            var articlesToDisplay: [ArticlesListViewModel]
        }
    }
    enum Error {
        struct ViewModel {
            let error: String
        }
    }
}
