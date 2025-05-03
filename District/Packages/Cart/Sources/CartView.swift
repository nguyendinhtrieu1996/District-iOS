import SwiftUI
import DesignSystem
import Assets
import Perception

public struct CartView: View {
    @Perception.Bindable private var viewModel: CartViewModel

    public init(viewModel: CartViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        VStack {
            Text("Cart View")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Text("Cart")
                    .font(.titleSmall)
                    .foregroundColor(.textPrimaryColor)
            }
        }
    }
} 
