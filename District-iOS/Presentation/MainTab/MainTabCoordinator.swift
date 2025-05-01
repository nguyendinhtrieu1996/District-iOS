import Coordinator
import DesignSystem

public final class MainTabCoordinator: TabbarCoordinator<MainTabPage> {

    public init() {
        let style = TabbarCoordinatorStyle(
            itemStyle: .init(color: .textSecondaryColor, tintColor: .textPrimaryColor),
            dividerStyle: .init(color: .textSecondaryColor, height: 1.0),
            isEnableBadgeNumber: true
        )
        super.init(pages: Page.allCases, currentPage: .home, coordinatorStyle: style)
    }
}
