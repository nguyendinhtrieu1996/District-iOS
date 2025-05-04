//
//  StoreViewModel.swift
//  District
//
//  Created by Trieu Nguyen on 3/5/25.
//

import Foundation
import Perception

@Perceptible
public final class StoreViewModel {
    weak var coordinator: StoreCoordinator?

    public init(coordinator: StoreCoordinator? = nil) {
        self.coordinator = coordinator
    }

    public func selectProduct() {
        Task(priority: .high) {
            await coordinator?.navigateToProduct()
        }
    }

    public func selectCategory() {
        Task(priority: .high) {
            await coordinator?.navigateToCategory()
        }
    }
} 
