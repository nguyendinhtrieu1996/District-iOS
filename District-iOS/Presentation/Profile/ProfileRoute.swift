//
//  ProfileRoute.swift
//  District-iOS
//
//  Created by Trieu Nguyen on 1/5/25.
//

import SwiftUI
import Coordinator
import Profile

public enum ProfileRoute: RouteType {
    case profile
    case profileDetail
    case settings
    case editProfile
    case orders

    public var presentationStyle: TransitionPresentationStyle {
        switch self {
        case .profile:
            return .push
        case .profileDetail:
            return .push
        case .settings:
            return .push
        case .editProfile:
            return .push
        case .orders:
            return .push
        }
    }

    public var view: Body {
        switch self {
        case .profile:
            return ProfileView()
        default:
            return EmptyView()
        }
    }
} 
