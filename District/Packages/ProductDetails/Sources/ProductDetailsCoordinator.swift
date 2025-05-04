import Foundation

@MainActor
public protocol ProductDetailsCoordinator: AnyObject {
    func navigateBack() async
    func navigateToCart() async
    func presentProductDetails() async
    func pushProductDetails() async
    func navigateBackToRoot() async
} 