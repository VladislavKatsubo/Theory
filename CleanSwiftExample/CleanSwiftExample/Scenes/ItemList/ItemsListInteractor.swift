//
//  ItemsListInteractor.swift
//  CleanSwiftExample
//
//  Created by Vlad Katsubo on 31.03.23.
//

import Foundation

protocol ItemsListInteractorInput {
    func fetchItems(completion: @escaping ([String]) -> Void)
}

class ItemsListInteractor: ItemsListInteractorInput {
    func fetchItems(completion: @escaping ([String]) -> Void) {
        // Simulate an asynchronous fetch of item data
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            let items = ["MacBook Pro", "MacBook Air", "Mac Mini", "iPhone", "Apple Watch", "AirPods", "One more thing", "Incredible", "Amazing", "Mac Studio", "Mac Pro"]
            completion(items)
        }
    }
}
