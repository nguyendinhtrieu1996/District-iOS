import SwiftUI
import DesignSystem
import Assets
import Perception

public struct ProductDetailsView: View {
    @Perception.Bindable private var viewModel: ProductDetailsViewModel
    
    public init(viewModel: ProductDetailsViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        VStack {
            Text("Product Details View")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    viewModel.navigateBack()
                } label: {
                    Asset.chevronLeft.swiftUIImage
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }
            }
            
            ToolbarItem(placement: .principal) {
                Text("Product Details")
                    .font(.titleSmall)
                    .foregroundColor(.textPrimaryColor)
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    viewModel.navigateToCart()
                } label: {
                    Asset.cart.swiftUIImage
                        .resizable()
                        .frame(width: 24, height: 24)
                }
            }
        }
    }
} 
