import Foundation
import Perception

@Perceptible
public final class CartViewModel {
    public weak var coordinator: CartCoordinator?

    public init(coordinator: CartCoordinator? = nil) {
        self.coordinator = coordinator
    }

    func navigateBack() async {
        await coordinator?.navigateBack()
    }
}
