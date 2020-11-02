//
//  GameViewModel.swift
//  NameGame
//
//  Created by Michal Hus on 11/1/20.
//

import Foundation
import Combine

class GameViewModel: ObservableObject, Identifiable {
    private let profileService = ProfileService()
    @Published var profileViewModels = [ProfileViewModel]()
    
    var cancellable: AnyCancellable?
    
    func fetchProfiles() {
        cancellable = profileService.fetchProfiles()
            .sink(receiveCompletion: { completion in
                print(completion)
            }, receiveValue: { profileResponse in
                self.profileViewModels = profileResponse.map { ProfileViewModel(profile: $0)}
                print(self.profileViewModels)
            })
    }
    
}
