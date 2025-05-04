//
//  ProfileCoordinator.swift
//  District
//
//  Created by Trieu Nguyen on 3/5/25.
//

import Foundation

@MainActor
public protocol ProfileCoordinator: AnyObject {
    func navigateToEditProfile() async
    func navigateToSettings() async
} 