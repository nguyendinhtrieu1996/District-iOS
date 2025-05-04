import SwiftUI
import Perception

public struct StoreView: View {
    @Perception.Bindable private var viewModel: StoreViewModel

    public init(viewModel: StoreViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        Text("Store View")
    }
}
