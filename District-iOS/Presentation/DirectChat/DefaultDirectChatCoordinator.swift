//
//  DefaultDirectChatCoordinator.swift
//  District-iOS
//
//  Created by Trieu Nguyen on 1/5/25.
//

import SwiftUI
import Coordinator
import DirectChat

public final class DefaultDirectChatCoordinator: Coordinator<DirectChatRoute> {

    public override func start(animated: Bool = true) async {
        await startFlow(route: .directChat)
    }
} 
