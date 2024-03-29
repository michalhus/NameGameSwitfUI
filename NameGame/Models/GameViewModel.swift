//
//  GameViewModel.swift
//  NameGame
//
//  Created by Michal Hus on 11/1/20.
//

import Foundation
import Combine

class GameViewModel: ObservableObject, Identifiable {
    
    static let shared = GameViewModel()
    private let profileService = ProfileService()
    @Published var profileViewModels = [ProfileViewModel]()
    @Published var targetProfile: String = ""
    @Published var score: Int = 0
    
    var cancellable: AnyCancellable?
    
    func fetchProfiles() {
        cancellable = profileService.fetchProfiles()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error): print("Error \(error)")
                case .finished: print("Publisher is finished")
                }
            }, receiveValue: { profileResponse in
                self.profileViewModels = Array(profileResponse
                                                .filter { $0.headshot.url != nil }
                                                .map { ProfileViewModel(profile: $0)}
                                                .shuffled()
                                                .prefix(upTo: 6))
                self.setTargetProfile()
            })
    }
    
    func setTargetProfile() {
        if let randomProfile = profileViewModels.randomElement() {
            targetProfile = randomProfile.name
        }
    }
    
    func isSelectedCorrect(_ selectedProfile: String) -> Bool {
        return targetProfile == selectedProfile ? true : false
    }
}
