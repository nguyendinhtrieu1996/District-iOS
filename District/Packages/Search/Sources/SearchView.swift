import SwiftUI
import Perception

public struct SearchView: View {
    @Perception.Bindable private var viewModel: SearchViewModel

    public init(viewModel: SearchViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        Text("Search View")
    }
}
