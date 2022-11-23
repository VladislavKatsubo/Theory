//
//  TableViewCellViewModelType.swift
//  MVVM-2
//
//  Created by Vlad Katsubo on 23.11.22.
//

import Foundation

protocol TableViewCellViewModelType: AnyObject {
    var fullName: String { get }
    var age: String { get }
}
