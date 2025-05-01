//
//  DefaultStoreCoordinator.swift
//  District-iOS
//
//  Created by Trieu Nguyen on 1/5/25.
//

import SwiftUI
import Coordinator
import Store

public final class DefaultStoreCoordinator: Coordinator<StoreRoute> {

    public override func start(animated: Bool = true) async {
        await startFlow(route: .store)
    }
} 
