//
//  Coordinator+Extensions.swift
//  District-iOS
//
//  Created by Trieu Nguyen on 4/5/25.
//

import Foundation
import Coordinator

public extension Coordinator {
    func navigateBack() async {
        await finishFlow()
    }
}
