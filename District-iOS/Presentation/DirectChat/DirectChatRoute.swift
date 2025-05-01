//
//  DirectChatRoute.swift
//  District-iOS
//
//  Created by Trieu Nguyen on 1/5/25.
//

import SwiftUI
import Coordinator
import DirectChat

public enum DirectChatRoute: RouteType {
    case directChat
    case chatList
    case chatDetail
    case newChat

    public var presentationStyle: TransitionPresentationStyle {
        switch self {
        case .directChat:
            return .push
        case .chatList:
            return .push
        case .chatDetail:
            return .push
        case .newChat:
            return .push
        }
    }

    public var view: Body {
        switch self {
        case .directChat:
            return DirectChatView()
        default:
            return EmptyView()
        }
    }
} 
