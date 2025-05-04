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
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    Task { await viewModel.navigateBack() }
                } label: {
                    Asset.chevronLeft.swiftUIImage
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }
            }

            ToolbarItem(placement: .principal) {
                Text("Cart")
                    .font(.titleSmall)
                    .foregroundColor(.textPrimaryColor)
            }
        }
    }
} 
