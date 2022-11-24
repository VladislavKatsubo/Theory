//
//  NetworkManager.swift
//  MVVM-3
//
//  Created by Vlad Katsubo on 23.11.22.
//

import Foundation

class NetworkManager: NSObject {
    
    func fetchMovies(completion: ([String]) -> ()) {
        completion(["Movie 1", "Movie 2", "Movie 3"])
    }
    
}
