//
//  ItemListConfigurator.swift
//  CleanSwiftExample
//
//  Created by Vlad Katsubo on 31.03.23.
//

import UIKit

class ItemsListConfigurator {
    static func configure() -> ItemsListViewController {
        let interactor = ItemsListInteractor()
        let presenter = ItemsListPresenter()
        let router = ItemsListRouter()
        let viewController = ItemsListViewController(interactor: interactor, presenter: presenter, router: router)
        return viewController
    }
}
