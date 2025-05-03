import Foundation

@MainActor
public protocol CartCoordinator: AnyObject {
    func navigateBack() async
}
