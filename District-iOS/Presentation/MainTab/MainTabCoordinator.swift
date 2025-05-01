import Coordinator
import DesignSystem
import Foundation

public final class MainTabCoordinator: TabbarCoordinator<MainTabPage> {

    public init() {
        let style = TabbarCoordinatorStyle(
            itemStyle: .init(color: .textSecondaryColor, tintColor: .textPrimaryColor),
            badgeStyle: .init(
                textColor: .paletteColor,
                backgroundColor: .backgroundGrouped,
                font: .tinyMedium,
                cornerRadius: 3
            ),
            dividerStyle: .init(color: .borderSeparator, height: 0.5)
        )
        super.init(pages: Page.allCases, currentPage: .home, coordinatorStyle: style)

        observeBadgeNumber()
    }
}

private extension MainTabCoordinator {
    func observeBadgeNumber() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            self.setBadge.send(("25", .directChat))

            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(6)) {
                self.setBadge.send((nil, .directChat))
            }
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5)) {
            self.setBadge.send(("5", .store))
        }
    }
}
