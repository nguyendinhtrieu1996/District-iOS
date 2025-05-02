import Foundation
import Perception

@Perceptible
public final class CartViewModel {
    weak var coordinator: CartCoordinator?

    public init(coordinator: CartCoordinator? = nil) {
        self.coordinator = coordinator
    }
} 