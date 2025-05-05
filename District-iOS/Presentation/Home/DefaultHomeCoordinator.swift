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
    public override init() {
        super.init()
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
                await self.present(to: DefaultProductDetailsCoordinator(), presentationStyle: .fullScreenCover)
            }
        }
    }
}

// MARK: - HomeCoordinator

extension DefaultHomeCoordinator: HomeCoordinator {
    public func navigateToNotification() async {
        await present(to: DefaultNotificationCoordinator(), presentationStyle: .fullScreenCover)
    }

    public func pushToNotification() async {
        var coordinator = DefaultNotificationCoordinator()
        await push(to: &coordinator)
    }

    public func navigateToCart() async {
        var coordinator = DefaultCartCoordinator()
        await push(to: &coordinator)
    }

    public func navigateToProductDetails() async {
        var coordinator = DefaultProductDetailsCoordinator()
        await push(to: &coordinator)
    }
}
