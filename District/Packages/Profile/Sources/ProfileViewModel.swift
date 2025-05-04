//
//  ProfileViewModel.swift
//  District
//
//  Created by Trieu Nguyen on 3/5/25.
//

import Foundation
import Perception

@Perceptible
public final class ProfileViewModel {
    weak var coordinator: ProfileCoordinator?

    public init(coordinator: ProfileCoordinator? = nil) {
        self.coordinator = coordinator
    }

    public func selectEditProfile() {
        Task(priority: .high) {
            await coordinator?.navigateToEditProfile()
        }
    }

    public func selectSettings() {
        Task(priority: .high) {
            await coordinator?.navigateToSettings()
        }
    }
}
