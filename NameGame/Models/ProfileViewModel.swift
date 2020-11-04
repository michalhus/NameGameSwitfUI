//
//  ProfileViewModel.swift
//  NameGame
//
//  Created by Michal Hus on 11/1/20.
//

import Foundation

struct ProfileViewModel: Identifiable {
    private let profile: ProfileResponse
    var isTarget: Bool
    var id = UUID()

    var name: String {
        return "\(profile.firstName) \(profile.lastName)"
    }
    
    var headshot: String? {
        if let url = profile.headshot.url {
            return "https:\(url)"
        }
        return nil
    }
    
    init(profile: ProfileResponse, _ isTarget: Bool = false) {
        self.profile = profile
        self.isTarget = isTarget
    }
}
