//
//  Box.swift
//  MVVM-2
//
//  Created by Vlad Katsubo on 23.11.22.
//

import Foundation

class Box<T> {
    
    typealias Listener = (T) -> ()
    
    var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    func bind(_ listener: @escaping Listener) {
        self.listener = listener
        listener(value)
    }
    
    init(value: T) {
        self.value = value
    }
}
