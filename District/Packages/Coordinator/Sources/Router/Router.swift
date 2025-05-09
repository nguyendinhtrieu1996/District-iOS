//
//  Router.swift
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

import Combine
import Foundation

/// A class representing a router in the coordinator pattern.
///
/// Routers are responsible for the actual navigation and presentation of
/// views or coordinators within a coordinator-based architecture.

public class Router<Route: RouteType>: ObservableObject, RouterType {
    
    // --------------------------------------------------------------------
    // MARK: Wrapper Properties
    // --------------------------------------------------------------------
    
    /// The first view in the navigation flow.
    @Published public var mainView: Route?
    /// The array of routes managed by the navigation router.
    @Published public var items: [Route] = []
    // The sheet coordinator for presenting sheets.
    @Published public var sheetCoordinator: SheetCoordinator<Route.Body> = .init()
    
    // --------------------------------------------------------------------
    // MARK: Properties
    // --------------------------------------------------------------------
    
    /// The coordinator associated with the router.
    public var isTabbarCoordinable: Bool = false
    
    // --------------------------------------------------------------------
    // MARK: Constructor
    // --------------------------------------------------------------------
    
    /// Creates a new instance of the navigation router.
    public init() { }
    
    // --------------------------------------------------------------------
    // MARK: RouterType
    // --------------------------------------------------------------------
    
    /// Navigates to a specified route with optional presentation style and animation.
    ///
    /// - Parameters:
    ///   - route: The route to push to.
    ///   - presentationStyle: The transition presentation style for the navigation.
    ///   - animated: A boolean value indicating whether to animate the navigation.
    @MainActor public func push(
        to route: Route,
        animated: Bool = true
    ) async -> Void {
        await runActionWithAnimation(animated) { [weak self] in
            return { self?.items.append(route) }
        }
    }
    
    /// Presents a view or coordinator with optional presentation style and animation.
    ///
    /// - Parameters:
    ///   - view: The view or coordinator to present.
    ///   - presentationStyle: The transition presentation style for the presentation.
    ///   - animated: A boolean value indicating whether to animate the presentation.
    @MainActor public func present(
        _ view: Route,
        presentationStyle: TransitionPresentationStyle = .sheet,
        animated: Bool = true
    ) async -> Void {
        let item = SheetItem(
            id: "\(view.id) - \(UUID())",
            animated: animated,
            presentationStyle: presentationStyle,
            view: { view.view }
        )
        
        await presentSheet(item: item)
    }
    
    /// Pops the top view or coordinator from the navigation stack.
    ///
    /// - Parameters:
    ///   - animated: A boolean value indicating whether to animate the pop action.
    @MainActor public func pop(animated: Bool = true) async -> Void {
        await runActionWithAnimation(animated) { [weak self] in
            return { self?.handlePopAction() }
        }
    }
    
    /// Pops to the root of the navigation stack.
    ///
    /// - Parameters:
    ///   - animated: A boolean value indicating whether to animate the pop action.
    @MainActor public func popToRoot(animated: Bool = true) async -> Void {
        await dismiss(animated: animated)
        sheetCoordinator = .init()
        await runActionWithAnimation(animated) { [weak self] in
            return { self?.items.removeAll() }
        }
    }
    
    /// Dismisses the currently presented view or coordinator.
    ///
    /// - Parameters:
    ///   - animated: A boolean value indicating whether to animate the dismissal.
    @MainActor public func dismiss(animated: Bool = true) async -> Void {
        await sheetCoordinator.removeLastSheet(animated: animated)
    }
    
    /// Presents a sheet with a specified item.
    ///
    /// - Parameters:
    ///   - item: The sheet item containing the view to present.
    @MainActor func presentSheet(item: SheetItem<RouteType.Body>) async -> Void {
        await sheetCoordinator.presentSheet(item)
    }
    
    /// Handles the pop action by updating the navigation stack.
    private func handlePopAction() {
        guard !items.isEmpty else { return }
        items.removeLast()
    }
}
