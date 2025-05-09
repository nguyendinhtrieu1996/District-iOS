//
//  SheetView.swift
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
import Foundation

struct SheetView<Content: View, T: SheetItemType & Identifiable>: View {
    typealias Item = T

    // ---------------------------------------------------------
    // MARK: Wrapper properties
    // ---------------------------------------------------------

    @Binding var items: [Item]

    // ---------------------------------------------------------
    // MARK: Properties
    // ---------------------------------------------------------

    let index: Int
    let content: ((Int, Item) -> Content)
    let onDismiss: ((Int) -> Void)?
    let onDidLoad: ((Int) -> Void)?

    // ---------------------------------------------------------
    // MARK: View
    // ---------------------------------------------------------

    var body: some View {
        Group {
            if let itemBinding = bindingForItem(at: index) {
                let presentationStyle = itemBinding.wrappedValue.getPresentationStyle()
                Group {
                    switch presentationStyle {
                    case .fullScreenCover:
                        fullScreenView(item: optionalBinding(from: itemBinding), index: index)
                    case .sheet:
                        sheetView(item: optionalBinding(from: itemBinding), index: index)
                    default:
                        EmptyView()
                    }
                }
                .transaction { $0.disablesAnimations = !(itemBinding.wrappedValue.isAnimated()) }
            }
        }
    }

    // ---------------------------------------------------------
    // MARK: Helper Views
    // ---------------------------------------------------------

    @ViewBuilder
    private func sheetView(item: Binding<Item?>, index: Int) -> some View {
        Color.clear
            .sheet(
                item: item,
                onDismiss: { onDismiss?(index) },
                content: { content(index, $0) }
            )
            .onViewDidLoad { onDidLoad?(index) }
    }

    @ViewBuilder
    private func fullScreenView(item: Binding<Item?>, index: Int) -> some View {
        Color.clear
            .fullScreenCover(
                item: item,
                onDismiss: { onDismiss?(index) },
                content: { content(index, $0) }
            )
            .onViewDidLoad { onDidLoad?(index) }
    }

    // ---------------------------------------------------------
    // MARK: Helper functions
    // ---------------------------------------------------------

    private func bindingForItem(at index: Int) -> Binding<Item>? {
        guard items.indices.contains(index) else { return nil }
        return Binding(
            get: { items[index] },
            set: { items[index] = $0 }
        )
    }

    private func optionalBinding(from binding: Binding<Item>) -> Binding<Item?> {
        Binding<Item?>(
            get: { binding.wrappedValue },
            set: {
                if let value = $0 {
                    binding.wrappedValue = value
                }
            }
        )
    }
}
