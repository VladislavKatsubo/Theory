//
//  ItemsListRouter.swift
//  CleanSwiftExample
//
//  Created by Vlad Katsubo on 31.03.23.
//

import UIKit

protocol ItemsListRouterInput {
    func navigateToItemDetails(from viewController: UIViewController, with itemId: String)
}

class ItemsListRouter: ItemsListRouterInput {
    func navigateToItemDetails(from viewController: UIViewController, with itemId: String) {
        
    }
}
