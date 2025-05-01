//
//  DefaultProfileCoordinator.swift
//  District-iOS
//
//  Created by Trieu Nguyen on 1/5/25.
//

import SwiftUI
import Coordinator
import Profile

public final class DefaultProfileCoordinator: Coordinator<ProfileRoute> {

    public override func start(animated: Bool = true) async {
        await startFlow(route: .profile)
    }
} 
