//
//  ArticlesListViewController.swift
//  CleanArhictectureExample
//
//  Created by Vlad Katsubo on 1.04.23.
//

import UIKit

protocol ArticlesListViewControllerProtocol: AnyObject {
    func displayArticles(articles: [Article])
    func displayError(error: Error)
    func didSelectArticle(article: Article)
}

class ArticlesListViewController: UIViewController, ArticlesListViewControllerProtocol {
    private var articles: [Article] = []
    private let interactor: ArticlesListInteractor
    private let router: ArticlesListRouterProtocol

    private let tableView = UITableView(frame: .zero, style: .insetGrouped)

    init(interactor: ArticlesListInteractor, router: ArticlesListRouterProtocol) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupItems()

        interactor.fetchTopHeadlines()
    }

    func displayArticles(articles: [Article]) {
        self.articles = articles
        print(articles)
        tableView.reloadData()
    }

    func displayError(error: Error) {
        // Display an error message to the user
    }

    func didSelectArticle(article: Article) {
        router.navigateToArticleDetail(article: article)
    }
}


private extension ArticlesListViewController {
    // MARK: - Private methods
    func setupItems() {
        setupTableView()
    }

    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension ArticlesListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        articles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? UITableViewCell else { return .init(frame: .zero) }
        cell.textLabel?.text = articles[indexPath.row].title
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectArticle(article: articles[indexPath.row])
    }
}
