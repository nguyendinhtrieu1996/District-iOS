import SwiftUI
import Coordinator
import ProductDetails

public final class DefaultProductDetailsCoordinator: Coordinator<AppRoute> {
    public override func start(animated: Bool = true) async {
        let viewModel = ProductDetailsViewModel(coordinator: self)
        let route = AppRoute(
            presentationStyle: .push,
            view: ProductDetailsView(viewModel: viewModel)
        )
        await startFlow(route: route)
    }
}

// MARK: - ProductDetailsCoordinator

extension DefaultProductDetailsCoordinator: ProductDetailsCoordinator {
    public func navigateToCart() async {
        await navigate(to: DefaultCartCoordinator(initialRouter: router), presentationStyle: .push)
    }

    public func presentProductDetails() async {
        await navigate(to: DefaultProductDetailsCoordinator(), presentationStyle: .fullScreenCover)
    }

    public func pushProductDetails() async {
        await navigate(to: DefaultProductDetailsCoordinator(initialRouter: router), presentationStyle: .push)
    }

    public func navigateBackToRoot() async {
        NotificationCenter.default.post(name: .backToRoot, object: nil)
    }
}
