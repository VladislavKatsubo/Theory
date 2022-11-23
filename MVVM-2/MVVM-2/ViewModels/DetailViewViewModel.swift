//
//  DetailViewViewModel.swift
//  MVVM-2
//
//  Created by Vlad Katsubo on 23.11.22.
//

import Foundation

class DetailViewViewModel: DetailViewModelType {
    
    private var profile: Profile
    
    var age: Box<String?> = Box(value: nil)
    
    var description: String {
        return String(describing: profile.name + " " + profile.secondName + "," + "\(profile.age)")
    }
    
    init(profile: Profile) {
        self.profile = profile
    }
}
