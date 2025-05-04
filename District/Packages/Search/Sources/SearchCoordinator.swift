//
//  SearchCoordinator.swift
//  District
//
//  Created by Trieu Nguyen on 3/5/25.
//

import Foundation

@MainActor
public protocol SearchCoordinator: AnyObject {
    func navigateToSearchResult() async
    func navigateToFilter() async
} 