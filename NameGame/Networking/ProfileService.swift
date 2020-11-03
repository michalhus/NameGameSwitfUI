//
//  ProfileService.swift
//  NameGame
//
//  Created by Michal Hus on 11/1/20.
//

import Foundation
import Combine

final class ProfileService {
    
    var components: URLComponents {
        var components = URLComponents()
        components.scheme = ProfilesAPI.scheme
        components.host = ProfilesAPI.host
        components.path = ProfilesAPI.path

        return components
    }
    
    func fetchProfiles() -> AnyPublisher<[ProfileResponse], Error> {
        
        guard let url = components.url else {
          let error = ProfilesError.network(description: "Couldn't create URL")
          return Fail(error: error).eraseToAnyPublisher()
        }

        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [ProfileResponse].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
