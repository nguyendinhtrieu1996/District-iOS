import SwiftUI
import Coordinator
import ProductDetails

public enum ProductDetailsRoute: RouteType {
    case productDetails(coordinator: ProductDetailsCoordinator)
    
    public var presentationStyle: TransitionPresentationStyle {
        switch self {
        case .productDetails:
            return .push
        }
    }
    
    public var view: Body {
        switch self {
        case .productDetails(let coordinator):
            let viewModel = ProductDetailsViewModel(coordinator: coordinator)
            return ProductDetailsView(viewModel: viewModel)
        }
    }
} 