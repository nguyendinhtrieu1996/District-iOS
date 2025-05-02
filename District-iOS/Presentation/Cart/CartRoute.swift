import SwiftUI
import Coordinator
import Cart

public enum CartRoute: RouteType {
    case cart(coordinator: CartCoordinator)

    public var presentationStyle: TransitionPresentationStyle {
        switch self {
        case .cart:
            return .push
        }
    }

    public var view: Body {
        switch self {
        case .cart(let coordinator):
            let viewModel = CartViewModel(coordinator: coordinator)
            return CartView(viewModel: viewModel)
        }
    }
} 