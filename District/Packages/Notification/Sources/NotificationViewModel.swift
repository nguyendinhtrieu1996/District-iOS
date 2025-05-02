import Foundation
import Perception

@Perceptible
public final class NotificationViewModel {
    weak var coordinator: NotificationCoordinator?
    
    public init(coordinator: NotificationCoordinator? = nil) {
        self.coordinator = coordinator
    }
    
    public func navigateBack() {
        Task(priority: .high) {
            await coordinator?.navigateBack()
        }
    }
    
    public func navigateToProductDetails() {
        Task(priority: .high) {
            await coordinator?.navigateToProductDetails()
        }
    }
} 