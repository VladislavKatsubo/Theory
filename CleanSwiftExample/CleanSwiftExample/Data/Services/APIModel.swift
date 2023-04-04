//
//  APIModel.swift
//  CleanSwiftExample
//
//  Created by Vlad Katsubo on 4.04.23.
//

import Foundation

struct ArticlesResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}
