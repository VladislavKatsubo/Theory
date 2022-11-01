//
//  Safe.swift
//  SwiftBook - Patterns - Singleton
//
//  Created by Vlad Katsubo on 1.11.22.
//

import Foundation

class Safe {
    var money = 0
    static let shared = Safe()
    
    private init() {}
}
