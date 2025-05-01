//
//  TabbarCoordinatorStyle.swift
//  District
//
//  Created by Trieu Nguyen on 1/5/25.
//

import SwiftUI

public struct TabbarCoordinatorStyle {
    public let itemStyle: TabItemStyle
    public let badgeStyle: BadgeStyle
    public let dividerStyle: DividerStyle?

    public init(
        itemStyle: TabItemStyle,
        badgeStyle: BadgeStyle,
        dividerStyle: DividerStyle?
    ) {
        self.itemStyle = itemStyle
        self.badgeStyle = badgeStyle
        self.dividerStyle = dividerStyle
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
    struct BadgeStyle {
        public let textColor: Color
        public let backgroundColor: Color
        public let font: Font
        public let cornerRadius: CGFloat

        public init(
            textColor: Color,
            backgroundColor: Color,
            font: Font,
            cornerRadius: CGFloat
        ) {
            self.textColor = textColor
            self.backgroundColor = backgroundColor
            self.font = font
            self.cornerRadius = cornerRadius
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
            badgeStyle: .init(
                textColor: .white,
                backgroundColor: .red,
                font: .system(size: 12, weight: .bold),
                cornerRadius: 3
            ),
            dividerStyle: nil
        )
    }
}
