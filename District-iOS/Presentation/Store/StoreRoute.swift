//
//  StoreRoute.swift
//  District-iOS
//
//  Created by Trieu Nguyen on 1/5/25.
//

import SwiftUI
import Coordinator
import Store

public enum StoreRoute: RouteType {
    case store
    case storeList
    case storeDetail
    case productDetail
    case checkout

    public var presentationStyle: TransitionPresentationStyle {
        switch self {
        case .store:
            return .push
        case .storeList:
            return .push
        case .storeDetail:
            return .push
        case .productDetail:
            return .push
        case .checkout:
            return .push
        }
    }

    public var view: Body {
        switch self {
        case .store:
            return StoreView()
        case .storeList:
            return EmptyView()
        case .storeDetail:
            return EmptyView()
        case .productDetail:
            return EmptyView()
        case .checkout:
            return EmptyView()
        }
    }
} 
