//
//  DefaultStoreCoordinator.swift
//  District-iOS
//
//  Created by Trieu Nguyen on 1/5/25.
//

import SwiftUI
import Coordinator
import Store

public final class DefaultStoreCoordinator: Coordinator<AppRoute> {
    public override func start(animated: Bool = true) async {
        let viewModel = StoreViewModel(coordinator: self)
        let route = AppRoute(view: StoreView(viewModel: viewModel))
        await startFlow(route: route)
    }
}

// MARK: - StoreCoordinator

extension DefaultStoreCoordinator: StoreCoordinator {
    public func navigateToProduct() async {
        
    }
    
    public func navigateToCategory() async {

    }
}
