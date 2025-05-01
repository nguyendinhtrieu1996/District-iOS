//
//  MainTabPage.swift
//  District-iOS
//
//  Created by Trieu Nguyen on 1/5/25.
//

import SwiftUI
import Coordinator
import Assets
import DesignSystem

public enum MainTabPage: CaseIterable {
    case home
    case search
    case directChat
    case store
    case profile
}

extension MainTabPage: TabbarPage {
    public var title: (any View) {
        Text("")
    }

    public var icon: (any View) {
        switch self {
        case .home: return Asset.home.swiftUIImage.applyDefaultIconStyle()
        case .search: return Asset.search.swiftUIImage.applyDefaultIconStyle()
        case .directChat: return Asset.chat.swiftUIImage.applyDefaultIconStyle()
        case .store: return Asset.marketplace.swiftUIImage.applyDefaultIconStyle()
        case .profile: return Asset.profile.swiftUIImage.applyDefaultIconStyle()
        }
    }

    public var position: Int {
        switch self {
        case .home:
            return 0
        case .search:
            return 1
        case .directChat:
            return 2
        case .store:
            return 3
        case .profile:
            return 4
        }
    }

    public func coordinator() -> (any CoordinatorType) {
        switch self {
        case .home:
            return DefaultHomeCoordinator()
        case .search:
            return DefaultSearchCoordinator()
        case .directChat:
            return DefaultDirectChatCoordinator()
        case .store:
            return DefaultStoreCoordinator()
        case .profile:
            return DefaultProfileCoordinator()
        }
    }
}

private extension Image {
    func applyDefaultIconStyle() -> any View {
        self
            .renderingMode(.template)
            .resizable()
            .frame(width: 24, height: 24)
            .foregroundStyle(Color.textSecondaryColor)
    }
}
