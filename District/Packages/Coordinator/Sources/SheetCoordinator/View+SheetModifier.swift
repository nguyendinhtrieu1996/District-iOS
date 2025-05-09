//
//  View+SheetModifier.swift
//  District
//
//  Created by Trieu Nguyen on 7/5/25.
//

import SwiftUI

public extension View {
    func sheetCoordinator(
        coordinator: SheetCoordinator<(any View)>,
        index: Int = 0,
        onDissmis: ((Int) -> Void)? = nil,
        onDidLoad: ((Int) -> Void)? = nil
    ) -> some View {
        modifier(
            SheetCoordinatorView(
                coordinator: coordinator,
                index: index,
                onDissmis: onDissmis,
                onDidLoad: onDidLoad
            )
        )
    }
}
