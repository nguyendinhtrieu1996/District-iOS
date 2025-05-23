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

public extension CoordinatorType {
    
    /// Retrieves the top coordinator in the hierarchy, optionally starting from a specified coordinator.
    ///
    /// - Parameters:
    ///   - pCoodinator: The optional starting point for finding the top coordinator.
    /// - Returns: The top coordinator in the hierarchy or nil if none is found.
    /// - Throws: An error if the top coordinator retrieval fails.
    func topCoordinator(pCoodinator: TCoordinatorType? = nil) throws -> TCoordinatorType? {
        guard children.last != nil else { return self }
        var auxCoordinator = pCoodinator ?? self.children.last?.coordinator
        return try getDeepCoordinator(from: &auxCoordinator)
    }
    
    /// Navigates to a new coordinator with a specified presentation style.
    ///
    /// - Parameters:
    ///   - coordinator: The coordinator to present to.
    ///   - presentationStyle: The transition presentation style for the navigation. Note: `.push` style is not allowed in this method.
    ///   - animated: A boolean value indicating whether to animate the navigation.
    func present(
        to coordinator: TCoordinatorType,
        presentationStyle: TransitionPresentationStyle,
        animated: Bool = true
    ) async -> Void {
        startChildCoordinator(coordinator, nodeType: .present(style: presentationStyle))

        let item = SheetItem(
            id: "\(coordinator.uuid) - \(presentationStyle.id)",
            animated: animated,
            presentationStyle: presentationStyle,
            view: { [weak coordinator] in coordinator?.getView() }
        )

        await router.presentSheet(item: item)
    }

    /// Pushes a new coordinator using the same router as the current coordinator.
    ///
    /// This method enforces that both coordinators share the same `Route` type and
    /// ensures the pushed coordinator uses the same `Router<Route>`.
    ///
    /// - Parameters:
    ///   - coordinator: The coordinator to push.
    ///   - animated: Whether the push should be animated.
    func push<C: CoordinatorType>(
        to coordinator: inout C,
        animated: Bool = true
    ) async where C.Route == Route {

        // Force router assignment to ensure consistency in the navigation stack
        coordinator.router = router

        // Start as a child coordinator with push style
        startChildCoordinator(coordinator, nodeType: .present(style: .fullScreenCover))

        await coordinator.start(animated: animated)
    }

    /// Finishes the flow of the coordinator.
    ///
    /// - Parameters:
    ///   - animated: A boolean value indicating whether to animate the finish flow process.
    func finishFlow(animated: Bool = true) async -> Void {
        guard !isEmptyCoordinator else {
            assertionFailure("Coordinator is empty. Cannot finish flow.")
            return
        }

        guard let parent,
              let child = parent.children.first(where: { $0.coordinator.uuid == uuid }) else {
            assertionFailure("Coordinator not found in parent.")
            return
        }

        switch child.nodeType {
        case .push:
            await router.dismiss(animated: animated)
            await router.pop(animated: animated)
            await parent.removeChild(coordinator: self)

        case .root:
            break

        case .present:
            await parent.closeLastSheet()
            await parent.removeChild(coordinator: self)
        }
    }
    
    /// Starts a flow in the coordinator with a specified route and transition style.
    ///
    /// - Parameters:
    ///   - route: The route to start the flow.
    ///   - transitionStyle: The transition presentation style for the flow.
    ///   - animated: A boolean value indicating whether to animate the start flow process.
    func startFlow(route: Route, animated: Bool = true) async -> Void {
        if router.mainView != nil {
            await router.push(to: route, animated: animated)
        } else {
            router.mainView = route
        }
    }

    /// Forces the presentation of the coordinator.
    ///
    /// - Parameters:
    ///   - animated: A boolean value indicating whether to animate the presentation.
    ///   - presentationStyle: The transition presentation style for the forced presentation.
    ///   - mainCoordinator: The main coordinator associated with the forced presentation.
    ///   - Throws: An error if the presentation cannot be forced.
    ///   SeeAlso: TransitionPresentationStyle
    func forcePresentation(
        animated: Bool = true,
        presentationStyle: TransitionPresentationStyle = .sheet,
        mainCoordinator: (any CoordinatorType)? = nil
    ) async throws {
        let topCoordinator = try mainCoordinator?.topCoordinator()
        await topCoordinator?.present(to: self, presentationStyle: presentationStyle)
    }

    func popToRoot(animated: Bool) async {
        children.removeAll()
        await router.popToRoot(animated: animated)
    }
}
