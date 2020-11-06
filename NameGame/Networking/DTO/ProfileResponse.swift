//
//  ProfileResponse.swift
//  NameGame
//
//  Created by Michal Hus on 11/1/20.
//

import Foundation

struct ProfileResponse: Codable {
    let firstName: String
    let lastName: String
    let headshot: Headshot
    
    init(firstName: String, lastName: String, headshot: Headshot) {
        self.firstName = firstName
        self.lastName = lastName
        self.headshot = headshot
    }
}

struct Headshot: Codable {
    let url: String?

    init(url: String?) {
        self.url = url
    }
}
