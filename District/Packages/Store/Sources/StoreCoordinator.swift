//
//  StoreCoordinator.swift
//  District
//
//  Created by Trieu Nguyen on 3/5/25.
//

import Foundation

@MainActor
public protocol StoreCoordinator: AnyObject {
    func navigateToProduct() async
    func navigateToCategory() async
} 