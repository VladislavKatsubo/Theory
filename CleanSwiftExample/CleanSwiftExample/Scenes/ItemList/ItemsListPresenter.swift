//
//  ItemsListPresenter.swift
//  CleanSwiftExample
//
//  Created by Vlad Katsubo on 31.03.23.
//


protocol ItemsListPresenterInput {
    func presentItems(items: [String], view: ItemsListView)
}

class ItemsListPresenter: ItemsListPresenterInput {
    func presentItems(items: [String], view: ItemsListView) {
        let viewModels = items.map { ItemsCellViewModel(itemName: $0) }
        view.displayItems(items: viewModels)
    }
}
