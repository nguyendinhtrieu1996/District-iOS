//
//  CoordinatorType.swift
//
//  Copyright (c) Andres F. Lozano
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation

extension CoordinatorType {
    
    /// The root router associated with the coordinator.
    var root: (any RouterType) {
        return router
    }
    
    /// A boolean value indicating whether the coordinator is tabbar-coordinable.
    var isTabbarCoordinable: Bool {
        self is (any TabbarCoordinatable)
    }
    
    /// A boolean value indicating whether the coordinator is empty.
    var isEmptyCoordinator: Bool {
        parent == nil &&
        router.items.isEmpty &&
        router.sheetCoordinator.items.isEmpty &&
        (router.mainView == nil)
    }
    
    /// Retrieves a deep coordinator from the provided value.
    ///
    /// - Parameters:
    ///   - value: An inout parameter containing the coordinator value.
    /// - Returns: An optional deep coordinator of type TCoordinatorType.
    /// - Throws: An error if the deep coordinator retrieval fails.
    func getDeepCoordinator(from value: inout TCoordinatorType?) throws -> TCoordinatorType? {
        if value?.children.last == nil {
            return value
        } else if let value = value, let tabCoordinator = getTabbarCoordinable(value) {
            return try topCoordinator(pCoodinator: try tabCoordinator.getCoordinatorSelected())
        } else {
            var last = value?.children.last?.coordinator
            return try getDeepCoordinator(from: &last)
        }
    }
    
    /// Removes a child coordinator from the children array.
    ///
    /// - Parameters:
    ///   - coordinator: The child coordinator to be removed.
    func removeChild(coordinator : TCoordinatorType) async {
        guard let index = children.firstIndex(where: {$0.coordinator.uuid == coordinator.uuid}) else {
            return
        }
        children.remove(at: index)
    }

    /// Retrieves the tabbar-coordinable object associated with the provided coordinator.
    ///
    /// - Parameters:
    ///   - coordinator: The coordinator for which to retrieve the tabbar-coordinable object.
    /// - Returns: An optional tabbar-coordinable object conforming to any TabbarCoordinatable.
    func getTabbarCoordinable(_ coordinator: TCoordinatorType) ->  (any TabbarCoordinatable)? {
        coordinator as? (any TabbarCoordinatable)
    }
    
    /// Starts a child coordinator.
    ///
    /// - Parameters:
    ///   - coordinator: The child coordinator to be started.
    func startChildCoordinator(_ coordinator: TCoordinatorType, nodeType: CoordinatorNode.NodeType) {
        children.append(.init(coordinator: coordinator, nodeType: nodeType))
        coordinator.parent = self
    }
    
    /// Dismisses or pops the last presented sheet.
    ///
    /// - Parameters:
    ///   - animated: A boolean value indicating whether to animate the dismissal.
    func closeLastSheet(animated: Bool = true) async {
        await router.dismiss(animated: animated)
    }
}
