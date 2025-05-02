import SwiftUI
import DesignSystem
import Assets
import Perception

public struct NotificationView: View {
    @Perception.Bindable private var viewModel: NotificationViewModel
    
    public init(viewModel: NotificationViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        VStack {
            Text("Notification View")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Button {
                viewModel.navigateToProductDetails()
            } label: {
                Text("Go to Product Details")
                    .font(.bodyMedium)
                    .foregroundColor(.textPrimaryColor)
                    .padding()
                    .background(Color.paletteColor)
                    .cornerRadius(8)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    viewModel.navigateBack()
                } label: {
                    Asset.close.swiftUIImage
                        .resizable()
                        .frame(width: 24, height: 24)
                }
            }

            ToolbarItem(placement: .principal) {
                Text("Notifications")
                    .font(.titleSmall)
                    .foregroundColor(.textPrimaryColor)
            }
        }
    }
} 
