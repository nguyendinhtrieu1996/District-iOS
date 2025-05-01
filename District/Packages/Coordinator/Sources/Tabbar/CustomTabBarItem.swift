import SwiftUI

struct CustomTabBarItem: View {
    let icon: AnyView
    let isSelected: Bool
    let badgeText: String?
    let itemStyle: TabbarCoordinatorStyle.TabItemStyle
    let badgeStyle: TabbarCoordinatorStyle.BadgeStyle
    
    var body: some View {
        VStack(spacing: 3) {
            icon
                .foregroundColor(isSelected ? itemStyle.tintColor : itemStyle.color)
                .frame(width: 24, height: 24)

            if let badgeText = badgeText, !badgeText.isEmpty {
                Text(badgeText)
                    .foregroundStyle(badgeStyle.textColor)
                    .font(badgeStyle.font)
                    .frame(minWidth: 12, minHeight: 14)
                    .padding(.horizontal, 4.5)
                    .frame(height: 14)
                    .background(
                        RoundedRectangle(cornerRadius: badgeStyle.cornerRadius)
                            .fill(badgeStyle.backgroundColor)
                    )
            } else {
                Spacer()
                    .frame(height: 14) // Placeholder for badge
            }
        }
    }
} 
