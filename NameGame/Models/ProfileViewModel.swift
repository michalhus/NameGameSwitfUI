//
//  ProfileViewModel.swift
//  NameGame
//
//  Created by Michal Hus on 11/1/20.
//

import Foundation

struct ProfileViewModel {
    private let profile: ProfileResponse
    
    var name: String {
        return "\(profile.firstName) \(profile.lastName)"
    }
    
    var headshot: String {
        return "https:\(profile.headshot.url)"
    }
    
    init(profile: ProfileResponse) {
        self.profile = profile
    }
}
