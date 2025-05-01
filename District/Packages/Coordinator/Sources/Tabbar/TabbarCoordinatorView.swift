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
        VStack(spacing: 0) {
            TabView(selection: $dataSource.currentPage) {
                ForEach(pages, id: \.id) { page in
                    if let item = dataSource.getCoordinator(with: page.position) {
                        AnyView(item.getView())
                            .tag(page)
                    }
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))

            if let dividerStyle = style.dividerStyle {
                Divider()
                    .background(dividerStyle.color)
                    .frame(height: dividerStyle.height)
            }

            CustomTabBar(
                pages: pages,
                badges: badges,
                selectedPage: $dataSource.currentPage,
                style: style
            )
            .padding(.top, 16)
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
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
    }
    
    // ---------------------------------------------------------------------
    // MARK: Helper funcs
    // ---------------------------------------------------------------------

    private func badge(of page: Page) -> BadgeItem? {
        guard let index = getBadgeIndex(page: page) else {
            return nil
        }
        return badges[index]
    }

    private func getBadgeIndex(page: Page) -> Int? {
        badges.firstIndex(where: { $0.1 == page })
    }
}
