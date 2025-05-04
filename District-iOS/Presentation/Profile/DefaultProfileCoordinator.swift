//
//  DefaultProfileCoordinator.swift
//  District-iOS
//
//  Created by Trieu Nguyen on 1/5/25.
//

import SwiftUI
import Coordinator
import Profile

public final class DefaultProfileCoordinator: Coordinator<AppRoute> {
    public override func start(animated: Bool = true) async {
        let viewModel = ProfileViewModel(coordinator: self)
        let route = AppRoute(presentationStyle: .push, view: ProfileView(viewModel: viewModel))
        await startFlow(route: route)
    }
}

extension DefaultProfileCoordinator: ProfileCoordinator {
    public func navigateToEditProfile() async {
        
    }
    
    public func navigateToSettings() async {

    }
}
