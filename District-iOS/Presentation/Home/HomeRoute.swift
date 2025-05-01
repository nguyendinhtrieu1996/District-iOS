//
//  HomeRoute.swift
//  District-iOS
//
//  Created by Trieu Nguyen on 1/5/25.
//

import SwiftUI
import Coordinator
import Home

public enum HomeRoute: RouteType {
    case home(coordinator: HomeCoordinator)
    case noifications
    case cart
    case channels

    public var presentationStyle: TransitionPresentationStyle {
        switch self {
        case .home:
            return .push
        case .noifications:
            return .push
        case .cart:
            return .push
        case .channels:
            return .push
        }
    }

    public var view: Body {
        switch self {
        case .home(let coordinator):
            let viewModel = HomeViewModel(coordinator: coordinator)
            return HomeView(viewModel: viewModel)
        default:
            return EmptyView()
        }
    }
}
