//
//  DefaultSearchCoordinator.swift
//  District-iOS
//
//  Created by Trieu Nguyen on 1/5/25.
//

import SwiftUI
import Coordinator
import Search

public final class DefaultSearchCoordinator: Coordinator<SearchRoute> {

    public override func start(animated: Bool = true) async {
        await startFlow(route: .search)
    }
} 
