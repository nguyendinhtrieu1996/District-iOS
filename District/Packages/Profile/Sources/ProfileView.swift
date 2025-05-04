import SwiftUI
import Perception

public struct ProfileView: View {
    @Perception.Bindable private var viewModel: ProfileViewModel

    public init(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        Text("Profile View")
    }
}
