//
//  RouterType.swift
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
import Combine


/// A protocol representing a router in the coordinator pattern.
///
/// Routers are responsible for the actual navigation and presentation of
/// views or coordinators within a coordinator-based architecture.
public protocol RouterType: ObservableObject {
    
    // --------------------------------------------------------------------
    // MARK: Associated Type
    // --------------------------------------------------------------------
    
    /// The associated type representing the route associated with the router.
    associatedtype Route: RouteType
    
    // --------------------------------------------------------------------
    // MARK: Properties
    // --------------------------------------------------------------------

    /// The main view associated with the router.
    var mainView: Route? { get set }

    /// An array of route items associated with the router.
    var items: [Route] { get set }

    /// The coordinator associated with the router.
    var isTabbarCoordinable: Bool { get set }

    /// The sheet coordinator associated with the router.
    var sheetCoordinator: SheetCoordinator<Route.Body> { get set }
    
    // --------------------------------------------------------------------
    // MARK: Functions
    // --------------------------------------------------------------------
    
    /// Navigates to a specified route with optional presentation style and animation.
    ///
    /// - Parameters:
    ///   - route: The route to push to.
    ///   - animated: A boolean value indicating whether to animate the navigation.
    @MainActor func push(to route: Route, animated: Bool) async
    
    /// Presents a view or coordinator with optional presentation style and animation.
    ///
    /// - Parameters:
    ///   - view: The view or coordinator to present.
    ///   - presentationStyle: The transition presentation style for the presentation.
    ///   - animated: A boolean value indicating whether to animate the presentation.
    @MainActor func present(_ view: Route, presentationStyle: TransitionPresentationStyle, animated: Bool) async
    
    /// Pops the top view or coordinator from the navigation stack.
    ///
    /// - Parameters:
    ///   - animated: A boolean value indicating whether to animate the pop action.
    @MainActor func pop(animated: Bool) async
    
    /// Pops to the root of the navigation stack.
    ///
    /// - Parameters:
    ///   - animated: A boolean value indicating whether to animate the pop action.
    @MainActor func popToRoot(animated: Bool) async
    
    /// Dismisses the currently presented view or coordinator.
    ///
    /// - Parameters:
    ///   - animated: A boolean value indicating whether to animate the dismissal.
    @MainActor func dismiss(animated: Bool) async
}
