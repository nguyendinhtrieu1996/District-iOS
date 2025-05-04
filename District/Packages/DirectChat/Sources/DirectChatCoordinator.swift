//
//  DirectChatCoordinator.swift
//  District
//
//  Created by Trieu Nguyen on 3/5/25.
//

import Foundation

@MainActor
public protocol DirectChatCoordinator: AnyObject {
    func navigateToChat() async
    func navigateToNewMessage() async
} 