//
//  ArticlesListInteractorTests.swift
//  CleanSwiftExampleTests
//
//  Created by Vlad Katsubo on 5.04.23.
//

import XCTest
@testable import CleanSwiftExample

class MockArticlesListPresenter: ArticlesListPresentationLogic {
    var presentArticlesCalled = false
    var presentErrorCalled = false

    func presentArticles(response: ArticlesList.FetchArticles.Response) {
        presentArticlesCalled = true
    }

    func presentError(_ error: Error) {
        presentErrorCalled = true
    }
}

class MockNewsRepository: NewsRepositoryProtocol {
    var fetchTopHeadlinesResult: Result<[Article], Error>?

    func fetchTopHeadlines(completion: @escaping (Result<[Article], Error>) -> Void) {
        if let result = fetchTopHeadlinesResult {
            completion(result)
        }
    }
}

class ArticlesListInteractorTests: XCTestCase {
    var sut: ArticlesListInteractor!
    var mockPresenter: MockArticlesListPresenter!
    var mockNewsRepository: MockNewsRepository!

    override func setUp() {
        super.setUp()
        mockPresenter = MockArticlesListPresenter()
        mockNewsRepository = MockNewsRepository()
        sut = ArticlesListInteractor(presenter: mockPresenter, newsRepository: mockNewsRepository)
    }

    func testFetchArticlesSuccess() {
        // Given
        let article = Article(
            title: "Hello World!",
            description: "We are testing ArticlesListInteractor",
            urlToImage: "https://example.com/image",
            publishedAt: ".now()"
        )
        mockNewsRepository.fetchTopHeadlinesResult = .success([article])

        // When
        sut.fetchArticles(request: ArticlesList.FetchArticles.Request())

        // Then
        XCTAssertTrue(mockPresenter.presentArticlesCalled)
    }

    func testFetchArticlesFailure() {
        // Given
        mockNewsRepository.fetchTopHeadlinesResult = .failure(NSError(domain: "TestError", code: 0, userInfo: nil))

        // When
        sut.fetchArticles(request: ArticlesList.FetchArticles.Request())

        // Then
        XCTAssertTrue(mockPresenter.presentErrorCalled)
    }
}

