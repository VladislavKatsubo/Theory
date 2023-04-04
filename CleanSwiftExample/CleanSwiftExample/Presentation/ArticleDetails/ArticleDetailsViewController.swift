//
//  ArticleDetailsViewController.swift
//  CleanSwiftExample
//
//  Created by Vlad Katsubo on 4.04.23.
//

import UIKit

protocol ArticleDetailsDisplayLogic: AnyObject {
    func displayArticle(with viewModel: ArticleDetails.FetchArticleDetails.ViewModel)
    func displayImage(with image: UIImage?)
}

final class ArticleDetailsViewController: UIViewController {

    private let interactor: ArticleDetailsBusinessLogic

    private let titleLabel = UILabel()
    private let imageView = UIImageView()
    private let dateLabel = UILabel()
    private let descriptionLabel = UILabel()

    // MARK: - Init
    init(interactor: ArticleDetailsBusinessLogic) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupItems()
        interactor.loadArticle(request: ArticleDetails.FetchArticleDetails.Request())
    }


    // MARK: - Configure

    // MARK: - Public methods
    
}

extension ArticleDetailsViewController: ArticleDetailsDisplayLogic {
    func displayImage(with image: UIImage?) {
        imageView.image = image
    }

    func displayArticle(with viewModel: ArticleDetails.FetchArticleDetails.ViewModel) {
        let article = viewModel.articleToDisplay
        
        titleLabel.text = article.title
        dateLabel.text = article.formattedDate
        descriptionLabel.text = article.description
    }
}

private extension ArticleDetailsViewController {
    // MARK: - Private methods
    func setupItems() {
        view.backgroundColor = .white

        setupTitleLabel()
        setupImageView()
        setupDateLabel()
        setupDescriptionLabel()
    }

    func setupTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .systemFont(ofSize: 18.0, weight: .semibold)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 5
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20.0),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20.0),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20.0),
        ])
    }

    func setupImageView() {
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20.0),
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 250.0)
        ])
    }
    func setupDateLabel() {
        view.addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.font = .systemFont(ofSize: 14.0, weight: .thin)
        dateLabel.textColor = .black
        dateLabel.textAlignment = .left
        dateLabel.numberOfLines = 1
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20.0),
            dateLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20.0),
            dateLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20.0)
        ])
    }
    func setupDescriptionLabel() {
        view.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = .systemFont(ofSize: 16.0, weight: .regular)
        descriptionLabel.textColor = .black
        descriptionLabel.textAlignment = .justified
        descriptionLabel.numberOfLines = 0
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 20.0),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20.0),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20.0)
        ])
    }
}
