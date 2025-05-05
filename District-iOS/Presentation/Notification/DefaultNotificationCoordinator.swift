import SwiftUI
import Coordinator
import Notification
import ProductDetails
import Cart

public final class DefaultNotificationCoordinator: Coordinator<AppRoute> {
    public override func start(animated: Bool = true) async {
        let viewModel = NotificationViewModel(coordinator: self)
        let route = AppRoute(
            presentationStyle: .push,
            view: NotificationView(viewModel: viewModel)
        )
        await startFlow(route: route)
    }
}

// MARK: - NotificationCoordinator

extension DefaultNotificationCoordinator: NotificationCoordinator {
    public func navigateToProductDetails() async {
        await navigate(to: DefaultProductDetailsCoordinator(router: router), presentationStyle: .push)
    }
}
