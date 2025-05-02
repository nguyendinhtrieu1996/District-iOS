import Foundation
import Perception

@Perceptible
public final class ProductDetailsViewModel {
    weak var coordinator: ProductDetailsCoordinator?
    
    public init(coordinator: ProductDetailsCoordinator? = nil) {
        self.coordinator = coordinator
    }
    
    public func navigateBack() {
        Task(priority: .high) {
            await coordinator?.navigateBack()
        }
    }
    
    public func navigateToCart() {
        Task(priority: .high) {
            await coordinator?.navigateToCart()
        }
    }
} 