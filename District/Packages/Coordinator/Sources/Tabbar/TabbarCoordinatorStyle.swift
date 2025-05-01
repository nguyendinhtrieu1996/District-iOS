//
//  TabbarCoordinatorStyle.swift
//  District
//
//  Created by Trieu Nguyen on 1/5/25.
//

import SwiftUI

public struct TabbarCoordinatorStyle {
    public let itemStyle: TabItemStyle
    public let dividerStyle: DividerStyle?
    public let isEnableBadgeNumber: Bool

    public init(
        itemStyle: TabItemStyle,
        dividerStyle: DividerStyle?,
        isEnableBadgeNumber: Bool
    ) {
        self.itemStyle = itemStyle
        self.dividerStyle = dividerStyle
        self.isEnableBadgeNumber = isEnableBadgeNumber
    }
}

public extension TabbarCoordinatorStyle {
    struct TabItemStyle {
        public let color: Color
        public let tintColor: Color

        public init(
            color: Color,
            tintColor: Color
        ) {
            self.color = color
            self.tintColor = tintColor
        }
    }
}

public extension TabbarCoordinatorStyle {
    struct DividerStyle {
        public let color: Color
        public let height: CGFloat

        public init(color: Color, height: CGFloat) {
            self.color = color
            self.height = height
        }
    }
}

public extension TabbarCoordinatorStyle {
    static var `default`: TabbarCoordinatorStyle {
        TabbarCoordinatorStyle(
            itemStyle: .init(
                color: .gray,
                tintColor: .black
            ),
            dividerStyle: nil,
            isEnableBadgeNumber: true
        )
    }
}
