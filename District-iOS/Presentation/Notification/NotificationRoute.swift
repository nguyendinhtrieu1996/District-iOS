import SwiftUI
import Coordinator
import Notification
import ProductDetails
import Cart

@MainActor
public struct AppRoute: RouteType {
    public let presentationStyle: TransitionPresentationStyle
    public let view: Body

    public init(presentationStyle: TransitionPresentationStyle, view: Body) {
        self.presentationStyle = presentationStyle
        self.view = view
    }
}

public extension AppRoute {
    static func notifications(coordinator: NotificationCoordinator) -> AppRoute {
        return AppRoute(
            presentationStyle: .push,
            view: NotificationView(viewModel: NotificationViewModel(coordinator: coordinator))
        )
    }

    static func productDetails(coordinator: ProductDetailsCoordinator) -> AppRoute {
        return AppRoute(
            presentationStyle: .push,
            view: ProductDetailsView(viewModel: ProductDetailsViewModel(coordinator: coordinator))
        )
    }

    static func cart(coordinator: CartCoordinator) -> AppRoute {
        return AppRoute(
            presentationStyle: .push,
            view: CartView(viewModel: CartViewModel(coordinator: coordinator))
        )
    }
}
