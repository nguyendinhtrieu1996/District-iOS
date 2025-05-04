//
//  HomeViewModel.swift
//  District
//
//  Created by Trieu Nguyen on 1/5/25.
//

import Foundation
import Perception

@Perceptible
public final class HomeViewModel {
    weak var coordinator: HomeCoordinator?

    public init(coordinator: HomeCoordinator? = nil) {
        self.coordinator = coordinator
    }

    public func selectNotification() {
        Task(priority: .high) {
            await coordinator?.navigateToNotification()
        }
    }

    public func selectCart() {
        Task(priority: .high) {
            await coordinator?.navigateToCart()
        }
    }

    public func selectNotifications() {
        Task(priority: .high) {
            await coordinator?.pushToNotification()
        }
    }

    public func selectProductDetails() {
        Task(priority: .high) {
            await coordinator?.navigateToProductDetails()
        }
    }
}
