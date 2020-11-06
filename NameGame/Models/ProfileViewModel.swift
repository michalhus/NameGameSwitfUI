//
//  ProfileViewModel.swift
//  NameGame
//
//  Created by Michal Hus on 11/1/20.
//

import Foundation

struct ProfileViewModel: Identifiable {
    
    private let profile: ProfileResponse
    var id = UUID()

    var name: String {
        return "\(profile.firstName) \(profile.lastName)"
    }
    
    var headshot: String? {
        guard let url = profile.headshot.url else {
            return nil
        }
        return "https:\(url)"
    }
    
    init(profile: ProfileResponse) {
        self.profile = profile
    }
}
