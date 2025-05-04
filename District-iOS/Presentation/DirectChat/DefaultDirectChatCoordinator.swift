//
//  DefaultDirectChatCoordinator.swift
//  District-iOS
//
//  Created by Trieu Nguyen on 1/5/25.
//

import SwiftUI
import Coordinator
import DirectChat

public final class DefaultDirectChatCoordinator: Coordinator<AppRoute> {
    public override func start(animated: Bool = true) async {
        let viewModel = DirectChatViewModel(coordinator: self)
        let route = AppRoute(
            presentationStyle: .push,
            view: DirectChatView(viewModel: viewModel)
        )
        await startFlow(route: route)
    }
}

extension DefaultDirectChatCoordinator: DirectChatCoordinator {
    public func navigateToChat() async {

    }
    
    public func navigateToNewMessage() async {
        
    }
}
