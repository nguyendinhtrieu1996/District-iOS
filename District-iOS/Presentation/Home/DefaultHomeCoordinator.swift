//
//  DefaultHomeCoordinator.swift
//  District-iOS
//
//  Created by Trieu Nguyen on 1/5/25.
//

import SwiftUI
import Coordinator
import Home

public final class DefaultHomeCoordinator: Coordinator<HomeRoute> {

    public override func start(animated: Bool = true) async {
        await startFlow(route: .home)
    }
}
