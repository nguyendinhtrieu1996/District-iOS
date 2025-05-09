//
//  SheetCoordinating.swift
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

import SwiftUI
import Combine

struct SheetCoordinatorView: ViewModifier {
    
    // ---------------------------------------------------------
    // MARK: typealias
    // ---------------------------------------------------------
    
    typealias Action = ((Int) -> Void)
    typealias Value = (any View)
    
    // ---------------------------------------------------------
    // MARK: Wrapper Properties
    // ---------------------------------------------------------
    
    @ObservedObject var coordinator: SheetCoordinator<Value>

    // ---------------------------------------------------------
    // MARK: Properties
    // ---------------------------------------------------------

    let index: Int
    let onDissmis: Action?
    let onDidLoad: Action?

    // ---------------------------------------------------------
    // MARK: ViewModifier
    // ---------------------------------------------------------
    
    @ViewBuilder
    func body(content: Content) -> some View {
        content
            .background {
                VStack {
                    SheetView(
                        items: $coordinator.items,
                        index: index,
                        content: buildContent,
                        onDismiss: onDissmis,
                        onDidLoad: onDidLoad
                    )
                    .hidden($coordinator.items.isEmpty)
                }
            }
    }
    
    // ---------------------------------------------------------
    // MARK: Helper Views
    // ---------------------------------------------------------
    
    private func buildContent(
        index: Int,
        item: SheetItem<Value>
    ) -> some View {
        let view = (item.view() ?? AnyView(EmptyView()))
            .sheetCoordinator(
                coordinator: coordinator,
                index: index + 1,
                onDissmis: onDissmis,
                onDidLoad: onDidLoad
            )
            
        return addSheet(to: AnyView(view), with: item.presentationStyle)
    }
    
    @ViewBuilder
    private func addSheet(
        to content: some View,
        with presentationStyle: TransitionPresentationStyle
    ) -> some View {
        switch presentationStyle {
            case .detents(let data): content.presentationDetents(data)
            default: content
        }
    }
}


extension View {
    func hidden(_ shouldHide: Bool) -> some View {
        opacity(shouldHide ? 0 : 1)
    }
}
