//
//  DirectChatViewModel.swift
//  District
//
//  Created by Trieu Nguyen on 3/5/25.
//

import Foundation
import Perception

@Perceptible
public final class DirectChatViewModel {
    weak var coordinator: DirectChatCoordinator?

    public init(coordinator: DirectChatCoordinator? = nil) {
        self.coordinator = coordinator
    }

    public func selectChat() {
        Task(priority: .high) {
            await coordinator?.navigateToChat()
        }
    }

    public func selectNewMessage() {
        Task(priority: .high) {
            await coordinator?.navigateToNewMessage()
        }
    }
} 