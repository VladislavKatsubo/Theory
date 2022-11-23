//
//  DetailViewModelType.swift
//  MVVM-2
//
//  Created by Vlad Katsubo on 23.11.22.
//

import Foundation

protocol DetailViewModelType {
    var description: String { get }
    var age: Box<String?> { get }
}
