import SwiftUI
import DesignSystem
import Assets
import Perception

public struct HomeView: View {
    @Perception.Bindable private var viewModel: HomeViewModel

    public init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        NavigationStack {
            VStack {
                Text("Home View")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    navigationTitle
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    navigationTrailingItems
                }
            }
        }
    }
}

// MARK: - Navigation Bar Items

private extension HomeView {
    var navigationTitle: some View {
        HStack(spacing: 4) {
            Asset.niknak.swiftUIImage
                .resizable()
                .frame(width: 32, height: 32)
            
            Text("Niknax")
                .font(.titleSmall)
                .foregroundColor(.textPrimaryColor)

            Asset.chevronDown.swiftUIImage
                .font(.bodySmall)
                .foregroundColor(.textPrimaryColor)
        }
        .padding(.leading, 18)
    }
    
    var navigationTrailingItems: some View {
        HStack(spacing: 16) {
            notificationButton
            cartButton
        }
        .padding(.trailing, 14)
    }
    
    var notificationButton: some View {
        Button {
            viewModel.selectNotification()
        } label: {
            Asset.notification.swiftUIImage
                .resizable()
                .frame(width: 24, height: 24)
                .overlay(alignment: .topTrailing) {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 10, height: 10)
                        .offset(x: 2, y: -4)

                    Circle()
                        .fill(Color.paletteColor)
                        .frame(width: 8, height: 8)
                        .offset(x: 2, y: -4)
                }
        }
    }
    
    var cartButton: some View {
        Button {
            viewModel.selectCart()
        } label: {
            Asset.cart.swiftUIImage
                .resizable()
                .frame(width: 24, height: 24)
                .overlay(alignment: .topTrailing) {
                    ZStack {
                        Circle()
                            .fill(Color.paletteColor)
                            .frame(width: 16, height: 16)
                        
                        Text("5")
                            .font(.tiny)
                            .foregroundColor(.white)
                    }
                    .offset(x: 6, y: -6)
                }
        }
    }
}
