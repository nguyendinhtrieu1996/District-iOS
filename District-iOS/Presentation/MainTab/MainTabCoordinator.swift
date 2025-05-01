import Coordinator

public final class MainTabCoordinator: TabbarCoordinator<MainTabPage> {

    public init() {
        super.init(pages: Page.allCases, currentPage: .home)
    }
}
