//
//  SearchRoute.swift
//  District-iOS
//
//  Created by Trieu Nguyen on 1/5/25.
//

import SwiftUI
import Coordinator
import Search

public enum SearchRoute: RouteType {
    case search
    case searchResults
    case filters
    case productDetail

    public var presentationStyle: TransitionPresentationStyle {
        switch self {
        case .search:
            return .push
        case .searchResults:
            return .push
        case .filters:
            return .push
        case .productDetail:
            return .push
        }
    }

    public var view: Body {
        switch self {
        case .search:
            return SearchView()
        default:
            return EmptyView()
        }
    }
} 
