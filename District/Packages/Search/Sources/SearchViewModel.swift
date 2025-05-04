//
//  SearchViewModel.swift
//  District
//
//  Created by Trieu Nguyen on 3/5/25.
//

import Foundation
import Perception

@Perceptible
public final class SearchViewModel {
    weak var coordinator: SearchCoordinator?

    public init(coordinator: SearchCoordinator? = nil) {
        self.coordinator = coordinator
    }

    public func selectSearchResult() {
        Task(priority: .high) {
            await coordinator?.navigateToSearchResult()
        }
    }

    public func selectFilter() {
        Task(priority: .high) {
            await coordinator?.navigateToFilter()
        }
    }
} 