import SwiftUI
import Coordinator
import ProductDetails

public final class DefaultProductDetailsCoordinator: Coordinator<ProductDetailsRoute> {
    
    public override func start(animated: Bool = true) async {
        await startFlow(route: .productDetails(coordinator: self))
    }
}

// MARK: - ProductDetailsCoordinator

extension DefaultProductDetailsCoordinator: ProductDetailsCoordinator {
    public func navigateBack() async {
        await finishFlow()
    }
    
    public func navigateToCart() async {
        // TODO: Implement cart navigation
    }
} 
