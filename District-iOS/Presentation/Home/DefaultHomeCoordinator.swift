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

public final class DefaultHomeCoordinator: Coordinator<AppRoute> {
    public override init(router: Router<AppRoute> = .init()) {
        super.init(router: router)

        handleDeepLink()
    }

    public override func start(animated: Bool = true) async {
        let viewModel = HomeViewModel(coordinator: self)
        let route = AppRoute(presentationStyle: .push, view: HomeView(viewModel: viewModel))
        await startFlow(route: route)
    }
}

private extension DefaultHomeCoordinator {
    func handleDeepLink() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5)) { [weak self] in
            guard let self = self else { return }
            Task(priority: .high) {
                await self.navigate(to: DefaultProductDetailsCoordinator(), presentationStyle: .fullScreenCover)
            }
        }
    }
}

// MARK: - HomeCoordinator

extension DefaultHomeCoordinator: HomeCoordinator {
    public func navigateToNotification() async {
        await navigate(to: DefaultNotificationCoordinator(), presentationStyle: .fullScreenCover)
    }

    public func pushToNotification() async {
        await navigate(to: DefaultNotificationCoordinator(router: router), presentationStyle: .push)
    }

    public func navigateToCart() async {
        await navigate(to: DefaultCartCoordinator(router: router), presentationStyle: .push)
    }

    public func navigateToProductDetails() async {
        await navigate(to: DefaultProductDetailsCoordinator(router: router), presentationStyle: .push)
    }
}
