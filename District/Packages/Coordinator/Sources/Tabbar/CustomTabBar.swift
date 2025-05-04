import SwiftUI

struct CustomTabBar<Page: TabbarPage>: View {
    let pages: [Page]
    let badges: [(value: String?, page: Page)]
    @Binding var selectedPage: Page
    let style: TabbarCoordinatorStyle
    let onSelect: ((Page) -> Void)?

    var body: some View {
        HStack {
            ForEach(pages, id: \.id) { page in
                let isSected = selectedPage == page
                Button(action: {
                    selectedPage = page
                    onSelect?(page)
                }) {
                    CustomTabBarItem(
                        icon: AnyView(page.icon),
                        isSelected: isSected,
                        badgeText: getBadgeText(for: page),
                        itemStyle: style.itemStyle,
                        badgeStyle: style.badgeStyle
                    )
                }
                .buttonStyle(TabButtonStyle(highlighted: isSected))
                .frame(maxWidth: .infinity)
            }
        }
    }
    
    private func getBadgeText(for page: Page) -> String? {
        guard let badge = badges.first(where: { $0.page == page }) else { return nil }
        return badge.value
    }
} 

private struct TabButtonStyle: ButtonStyle {
    let highlighted: Bool
    @Binding var isAnimated: Bool

    init(highlighted: Bool, isAnimated: Binding<Bool> = .constant(true)) {
        self.highlighted = highlighted
        _isAnimated = isAnimated
    }

    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .scaleEffect(configuration.isPressed ? 0.80 : 1)
            .animation(
                isAnimated ? .interpolatingSpring(mass: 1, stiffness: 170, damping: 15, initialVelocity: 0) : nil,
                value: configuration.isPressed
            )
    }
}
