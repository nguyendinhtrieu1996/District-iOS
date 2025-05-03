//
//  DefaultHomeCoordinator.swift
//  District-iOS
//
//  Created by Trieu Nguyen on 1/5/25.
//

import SwiftUI
import Coordinator
import Home
import Cart

public final class DefaultHomeCoordinator: Coordinator<HomeRoute> {

    public override func start(animated: Bool = true) async {
        await startFlow(route: .home(coordinator: self))
    }
}

// MARK: - HomeCoordinator

extension DefaultHomeCoordinator: HomeCoordinator {
    public func navigateToNotification() async {
        await navigate(to: DefaultNotificationCoordinator(), presentationStyle: .fullScreenCover)
    }

    public func navigateToCart() async {
        await router.navigate(to: .cart(coordinator: self))
    }
}

// MARK: - CartCoordinator

extension DefaultHomeCoordinator: CartCoordinator {
    public func navigateBack() async {
        await router.pop(animated: true)
    }
}
