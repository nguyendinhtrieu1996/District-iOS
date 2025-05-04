//
//  District_iOSApp.swift
//  District-iOS
//
//  Created by Trieu Nguyen on 1/5/25.
//

import SwiftUI
import Coordinator

extension Notification.Name {
    static let backToRoot = Notification.Name("backToRoot")
}

@main
struct District_iOSApp: App {
    let mainTabCoordinator = MainTabCoordinator()

    var body: some Scene {
        WindowGroup {
            mainTabCoordinator.getView()
                .navigationBarTitleDisplayMode(.inline)
                .onReceive(NotificationCenter.default.publisher(for: .backToRoot)) { _ in
                    Task { @MainActor in
                        try await mainTabCoordinator.popToRoot(animated: false)
                    }
                }
        }
    }
}
