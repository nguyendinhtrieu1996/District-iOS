//
//  TabbarCoordinatorView.swift
//
//  Copyright (c) Andres F. Lozano
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import SwiftUI
import Foundation

struct TabbarCoordinatorView<DataSource: TabbarCoordinatorType>: View {
    
    typealias Page = DataSource.Page
    typealias BadgeItem = DataSource.BadgeItem
    
    // ---------------------------------------------------------------------
    // MARK: Properties
    // ---------------------------------------------------------------------

    private let style: TabbarCoordinatorStyle
    private let customDividerName = "TabCoordinatorCustomDivider"

    @StateObject var dataSource: DataSource
    @State var badges = [BadgeItem]()
    @State var pages = [Page]()
    @State var currentPage: Page
    
    init(
        dataSource: DataSource,
        currentPage: Page,
        style: TabbarCoordinatorStyle
    ) {
        self._dataSource = .init(wrappedValue: dataSource)
        self.currentPage = dataSource.currentPage
        self.style = style
    }
    
    // ---------------------------------------------------------------------
    // MARK: View
    // ---------------------------------------------------------------------
    
    public var body: some View {
        TabView(selection: $dataSource.currentPage){
            ForEach(pages, id: \.id, content: tabBarItem)
        }
        .onChange(of: dataSource.pages) { pages in
            self.pages = pages
            badges = pages.map { (nil, $0) }
        }
        .onChange(of: dataSource.currentPage) { page in
            currentPage = page
        }
        .onReceive(dataSource.setBadge) { (value, page) in
            guard let index = getBadgeIndex(page: page) else { return }
            badges[index].value = value
        }
        .task {
            pages = dataSource.pages
            badges = pages.map { (nil, $0) }
        }
        .onAppear(perform: setupTabBarAppearance)
    }
    
    // ---------------------------------------------------------------------
    // MARK: Helper funcs
    // ---------------------------------------------------------------------

    @ViewBuilder
    func tabBarItem(with page: Page) -> some View {
        if let item = dataSource.getCoordinator(with: page.position) {
            AnyView( item.getView() )
                .tabItem {
                    Label(
                        title: { AnyView(page.title) },
                        icon: { AnyView(page.icon) }
                    )
                }
                .badge(badge(of: page)?.value)
                .tag(page)
        }
    }

    private func badge(of page: Page) -> BadgeItem? {
        guard let index = getBadgeIndex(page: page) else {
            return nil
        }
        return badges[index]
    }

    private func getBadgeIndex(page: Page) -> Int? {
        badges.firstIndex(where: { $0.1 == page })
    }

    // ---------------------------------------------------------------------
    // MARK: Custom Tabbar Appearance
    // ---------------------------------------------------------------------

    private func setupTabBarAppearance() {
        configureTabBarAppearance()
        if let dividerStyle = style.dividerStyle {
            addCustomDivider(style: dividerStyle)
        }
    }
    
    private func configureTabBarAppearance() {
        let standardAppearance = UITabBarAppearance()
        standardAppearance.configureWithOpaqueBackground()
        standardAppearance.backgroundColor = UIColor.systemBackground
        
        let itemAppearance = UITabBarItemAppearance()
        let itemStyle = style.itemStyle
        itemAppearance.normal.iconColor = UIColor(itemStyle.color)
        itemAppearance.selected.iconColor = UIColor(itemStyle.tintColor)

        standardAppearance.inlineLayoutAppearance = itemAppearance
        standardAppearance.stackedLayoutAppearance = itemAppearance
        standardAppearance.compactInlineLayoutAppearance = itemAppearance
        
        UITabBar.appearance().standardAppearance = standardAppearance
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = standardAppearance
        }
    }
    
    private func addCustomDivider(style: TabbarCoordinatorStyle.DividerStyle) {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first(where: { $0.isKeyWindow }),
              let rootViewController = window.rootViewController else {
            return
        }
        
        let tabBarController = findTabBarController(from: rootViewController)
        guard let tabBar = tabBarController?.tabBar else { return }
        
        if !(tabBar.layer.sublayers?.contains(where: { $0.name == customDividerName }) ?? false) {
            let divider = createDividerLayer(for: tabBar, style: style)
            tabBar.layer.addSublayer(divider)
        }
    }
    
    private func findTabBarController(from viewController: UIViewController) -> UITabBarController? {
        if let tabBar = viewController as? UITabBarController {
            return tabBar
        }
        
        var currentVC = viewController
        while let presentedVC = currentVC.presentedViewController {
            if let tabBar = presentedVC as? UITabBarController {
                return tabBar
            }
            currentVC = presentedVC
        }
        
        return nil
    }
    
    private func createDividerLayer(for tabBar: UITabBar, style: TabbarCoordinatorStyle.DividerStyle) -> CALayer {
        let divider = CALayer()
        divider.name = customDividerName
        divider.backgroundColor = UIColor(style.color).cgColor
        divider.frame = CGRect(x: 0, y: 0, width: tabBar.bounds.width, height: style.height)
        return divider
    }
}
