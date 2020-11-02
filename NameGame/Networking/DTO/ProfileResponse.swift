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
}

struct Headshot: Codable {
    let url: String?
}
