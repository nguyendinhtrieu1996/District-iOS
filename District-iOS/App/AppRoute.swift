//
//  AppRoute.swift
//  District-iOS
//
//  Created by Trieu Nguyen on 3/5/25.
//

import Foundation
import Coordinator

@MainActor
public struct AppRoute: RouteType {
    public let presentationStyle: TransitionPresentationStyle
    public let view: Body

    public init(presentationStyle: TransitionPresentationStyle, view: Body) {
        self.presentationStyle = presentationStyle
        self.view = view
    }
}
