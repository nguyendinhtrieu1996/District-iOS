import SwiftUI
import Perception

public struct DirectChatView: View {
    @Perception.Bindable private var viewModel: DirectChatViewModel

    public init(viewModel: DirectChatViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        Text("Direct Chat View")
    }
}
