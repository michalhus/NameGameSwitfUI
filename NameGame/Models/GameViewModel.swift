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
    @Published var gameProfiles = [ProfileViewModel]()
    @Published var targetProfile: String = ""
    
    var cancellable: AnyCancellable?
    
    func fetchProfiles() {
        cancellable = profileService.fetchProfiles()
            .sink(receiveCompletion: { completion in
                print(completion)
            }, receiveValue: { profileResponse in
                self.profileViewModels = Array(profileResponse
                                                    .map { ProfileViewModel(profile: $0)}
                                                    .shuffled()
                                                    .prefix(upTo: 6))
                print(self.profileViewModels)
                self.setTargetProfile()
            })
    }
    
    func setTargetProfile() {
        if let randomProfile = profileViewModels.randomElement() {
            targetProfile = randomProfile.name
            print(targetProfile)
        }
    }
}
