//
//  ArticlesListViewController.swift
//  CleanSwiftExample
//
//  Created by Vlad Katsubo on 4.04.23.
//

import UIKit

protocol ArticlesListDisplayLogic: AnyObject {
    func displayArticles(viewModel: ArticlesList.FetchArticles.ViewModel)
    func displayError(viewModel: ArticlesList.Error.ViewModel)
}

class ArticlesListViewController: UIViewController {

    private let interactor: ArticlesListBusinessLogic
    private let router: ArticlesListRoutingLogic

    private var articles: [ArticlesList.FetchArticles.ViewModel.ArticlesListViewModel] = []
    private let tableView = UITableView(frame: .zero, style: .insetGrouped)

    // MARK: - Init
    init(interactor: ArticlesListBusinessLogic, router: ArticlesListRoutingLogic) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupItems()
        interactor.fetchArticles(request: ArticlesList.FetchArticles.Request())
    }
}

private extension ArticlesListViewController {
    // MARK: - Private methods
    func setupItems() {
        view.backgroundColor = .white
        setupTableView()
    }

    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension ArticlesListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        articles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? UITableViewCell else { return .init() }
        cell.textLabel?.text = articles[indexPath.row].title
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = articles[indexPath.row].article
        router.navigateToArticleDetails(article: article)
    }
}

extension ArticlesListViewController: ArticlesListDisplayLogic {
    func displayArticles(viewModel: ArticlesList.FetchArticles.ViewModel) {
        self.articles = viewModel.articlesToDisplay
        tableView.reloadData()
    }

    func displayError(viewModel: ArticlesList.Error.ViewModel) {
        print(viewModel.error)
    }
}
