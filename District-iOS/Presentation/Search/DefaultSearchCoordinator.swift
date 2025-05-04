//
//  DefaultSearchCoordinator.swift
//  District-iOS
//
//  Created by Trieu Nguyen on 1/5/25.
//

import SwiftUI
import Coordinator
import Search

public final class DefaultSearchCoordinator: Coordinator<AppRoute> {
    public override func start(animated: Bool = true) async {
        let viewModel = SearchViewModel(coordinator: self)
        let route = AppRoute(
            presentationStyle: .push,
            view: SearchView(viewModel: viewModel)
        )
        await startFlow(route: route)
    }
} 

// MARK: - SearchCoordinator

extension DefaultSearchCoordinator: SearchCoordinator {
    public func navigateToSearchResult() async {

    }
    
    public func navigateToFilter() async {

    }
}
