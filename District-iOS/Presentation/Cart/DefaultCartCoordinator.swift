import SwiftUI
import Coordinator
import Cart

public final class DefaultCartCoordinator: Coordinator<AppRoute> {
    public override func start(animated: Bool = true) async {
        let viewModel = CartViewModel(coordinator: self)
        let route = AppRoute(presentationStyle: .push, view: CartView(viewModel: viewModel))
        await startFlow(route: route)
    }
}

// MARK: - CartCoordinator

extension DefaultCartCoordinator: CartCoordinator {

}
