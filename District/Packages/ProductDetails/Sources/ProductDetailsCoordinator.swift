import Foundation

@MainActor
public protocol ProductDetailsCoordinator: AnyObject {
    func navigateBack() async
    func navigateToCart() async
} 