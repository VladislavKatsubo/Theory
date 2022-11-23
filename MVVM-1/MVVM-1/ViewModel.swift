//
//  ViewModel.swift
//  MVVM-1
//
//  Created by Vlad Katsubo on 23.11.22.
//

import Foundation

class ViewModel {
    private var profile = Profile(name: "Vlad", secondName: "Katsubo", age: 26)
    
    var name: String {
        return profile.name
    }
    
    var secondName: String {
        return profile.secondName
    }
    
    var age: Int {
        return profile.age
    }
}
