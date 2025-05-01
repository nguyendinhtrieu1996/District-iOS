//
//  DefaultHomeCoordinator.swift
//  District-iOS
//
//  Created by Trieu Nguyen on 1/5/25.
//

import SwiftUI
import Coordinator
import Home

public final class DefaultHomeCoordinator: Coordinator<HomeRoute> {

    public override func start(animated: Bool = true) async {
        await startFlow(route: .home(coordinator: self))
    }
}

// MARK: - HomeCoordinator

extension DefaultHomeCoordinator: HomeCoordinator {
    public func navigateToNotification() async {

    }

    public func navigateToCart() async {

    }
}
