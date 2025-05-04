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
        VStack(spacing: 16) {
            Text("Product Details View")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Button {
                viewModel.presentProductDetails()
            } label: {
                Text("Present Product Details")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.horizontal)
            
            Button {
                viewModel.pushProductDetails()
            } label: {
                Text("Push Product Details")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.horizontal)
            
            Button {
                viewModel.navigateBackToRoot()
            } label: {
                Text("Back to Root")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.horizontal)
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
