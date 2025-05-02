import Foundation

@MainActor
public protocol NotificationCoordinator: AnyObject {
    func navigateBack() async
    func navigateToProductDetails() async
} 