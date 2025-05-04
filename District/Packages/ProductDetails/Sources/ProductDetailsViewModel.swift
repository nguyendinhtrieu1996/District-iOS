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
    
    public func presentProductDetails() {
        Task(priority: .high) {
            await coordinator?.presentProductDetails()
        }
    }
    
    public func pushProductDetails() {
        Task(priority: .high) {
            await coordinator?.pushProductDetails()
        }
    }
    
    public func navigateBackToRoot() {
        Task(priority: .high) {
            await coordinator?.navigateBackToRoot()
        }
    }
} 