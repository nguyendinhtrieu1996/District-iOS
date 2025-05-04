//
//  Coordinator+Extensions.swift
//  District-iOS
//
//  Created by Trieu Nguyen on 4/5/25.
//

import Foundation
import Coordinator

public extension Coordinator {
    func navigateBack() async {
        guard let parent = parent,
              let childCoordinator = parent.children.first(where: { $0.id == id }) else {
            await finishFlow()
            return
        }

        if childCoordinator.presentationStyle == .push {
            await router.pop()
            parent.children.removeAll { $0.id == id }
            return
        }

        await finishFlow()
    }
}
