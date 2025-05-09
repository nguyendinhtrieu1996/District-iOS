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
    public let view: Body

    public init(view: Body) {
        self.view = view
    }
}
