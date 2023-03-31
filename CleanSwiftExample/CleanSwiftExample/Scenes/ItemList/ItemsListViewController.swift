//
//  ItemsListViewController.swift
//  CleanSwiftExample
//
//  Created by Vlad Katsubo on 31.03.23.
//

import UIKit

protocol ItemsListView: AnyObject {
    func displayItems(items: [ItemsCellViewModel])
}

final class ItemsListViewController: UIViewController {

    private let interactor: ItemsListInteractorInput
    private let presenter: ItemsListPresenterInput
    private let router: ItemsListRouterInput

    private let tableView = UITableView(frame: .zero, style: .plain)
    private var items: [ItemsCellViewModel] = []

    // MARK: - Init
    init(interactor: ItemsListInteractorInput, presenter: ItemsListPresenterInput, router: ItemsListRouterInput) {
        self.interactor = interactor
        self.presenter = presenter
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Apple Store"
        view.backgroundColor = .systemBackground
        setupItems()

        interactor.fetchItems { [weak self] fetchedItems in
            guard let self = self else { return }
            self.presenter.presentItems(items: fetchedItems, view: self)
            self.tableView.reloadData()
        }
    }

    // MARK: - Configure

    // MARK: - Public methods
}

private extension ItemsListViewController {
    // MARK: - Private methods
    func setupItems() {
        setupTableView()
    }

    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

extension ItemsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row].itemName
        return cell
    }
}

extension ItemsListViewController: ItemsListView {
    func displayItems(items: [ItemsCellViewModel]) {
        self.items = items
    }
}
