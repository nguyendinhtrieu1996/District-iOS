//
//  ChildCoordinator.swift
//  District
//
//  Created by Trieu Nguyen on 4/5/25.
//

import Foundation

@MainActor
public struct ChildCoordinator {
    public typealias TCoordinatorType = (any CoordinatorType)

    public let coordinator: TCoordinatorType
    public let presentationStyle: TransitionPresentationStyle

    public init(
        coordinator: TCoordinatorType,
        presentationStyle: TransitionPresentationStyle
    ) {
        self.coordinator = coordinator
        self.presentationStyle = presentationStyle
    }

    public var tagId: String? {
        coordinator.tagId
    }

    public var id: String {
        coordinator.id
    }
}
