//
//  CoordinatorNode.swift
//  District
//
//  Created by Trieu Nguyen on 4/5/25.
//

import Foundation

@MainActor
public struct CoordinatorNode {
    public typealias TCoordinatorType = (any CoordinatorType)

    public let coordinator: TCoordinatorType
    public let nodeType: NodeType

    public init(
        coordinator: TCoordinatorType,
        nodeType: NodeType
    ) {
        self.coordinator = coordinator
        self.nodeType = nodeType
    }

    public var tagId: String? {
        coordinator.tagId
    }

    public var id: String {
        coordinator.id
    }
}

public extension CoordinatorNode {
    enum NodeType {
        case root
        case push
        case present(style: TransitionPresentationStyle)
    }
}
