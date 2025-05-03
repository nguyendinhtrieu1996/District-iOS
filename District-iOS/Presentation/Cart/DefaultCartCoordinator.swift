import SwiftUI
import Coordinator
import Cart

public final class DefaultCartCoordinator: Coordinator<CartRoute> {

    public override func start(animated: Bool = true) async {
        await startFlow(route: .cart(coordinator: self))
    }
}

// MARK: - CartCoordinator

extension DefaultCartCoordinator: CartCoordinator {
    public func navigateBack() async {
        await finishFlow()
    }
}
