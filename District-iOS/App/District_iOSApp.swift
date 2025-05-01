//
//  District_iOSApp.swift
//  District-iOS
//
//  Created by Trieu Nguyen on 1/5/25.
//

import SwiftUI
import Coordinator

@main
struct District_iOSApp: App {
    let mainTabCoordinator = MainTabCoordinator()

    var body: some Scene {
        WindowGroup {
            mainTabCoordinator.getView()
        }
    }
}
