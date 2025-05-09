import SwiftUI
import Coordinator
import ProductDetails

public final class DefaultProductDetailsCoordinator: Coordinator<AppRoute> {
    public override func start(animated: Bool = true) async {
        let viewModel = ProductDetailsViewModel(coordinator: self)
        let route = AppRoute(view: ProductDetailsView(viewModel: viewModel))
        await startFlow(route: route)
    }
}

// MARK: - ProductDetailsCoordinator

extension DefaultProductDetailsCoordinator: ProductDetailsCoordinator {
    public func navigateToCart() async {
        var coordinator = DefaultCartCoordinator()
        await push(to: &coordinator)
    }

    public func presentProductDetails() async {
        await present(to: DefaultProductDetailsCoordinator(), presentationStyle: .fullScreenCover)
    }

    public func pushProductDetails() async {
        var coordinator = DefaultProductDetailsCoordinator()
        await push(to: &coordinator)
    }

    public func navigateBackToRoot() async {
        NotificationCenter.default.post(name: .backToRoot, object: nil)
    }
}
