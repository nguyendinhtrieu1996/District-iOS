import SwiftUI
import Coordinator
import Notification
import ProductDetails
import Cart

public final class DefaultNotificationCoordinator: Coordinator<AppRoute> {

    public override func start(animated: Bool = true) async {
        await startFlow(route: .notifications(coordinator: self))
    }
}

// MARK: - NotificationCoordinator

extension DefaultNotificationCoordinator: NotificationCoordinator {
    public func navigateBack() async {
        await finishFlow()
    }
    
    public func navigateToProductDetails() async {
        await router.navigate(to: .productDetails(coordinator: self))
    }
}

// MARK: - ProductDetailsCoordinator

extension DefaultNotificationCoordinator: ProductDetailsCoordinator {
    public func navigateToCart() async {
        await router.navigate(to: .cart(coordinator: self))
    }
}

// MARK: - CartCoordinator

extension DefaultNotificationCoordinator: CartCoordinator {

}
