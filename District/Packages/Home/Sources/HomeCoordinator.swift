//
//  HomeCoordinator.swift
//  District
//
//  Created by Trieu Nguyen on 1/5/25.
//

import Foundation

@MainActor
public protocol HomeCoordinator: AnyObject {
    func navigateToNotification() async
    func pushToNotification() async
    func navigateToCart() async
    func navigateToProductDetails() async
}
