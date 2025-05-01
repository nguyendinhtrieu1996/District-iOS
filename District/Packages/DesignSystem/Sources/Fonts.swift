//
//  Fonts.swift
//  District
//
//  Created by Trieu Nguyen on 1/5/25.
//

import SwiftUI
import UIKit

/**
 * https://www.figma.com/design/Gt0gkf0TFvOqe3X8BtZicC/%F0%9F%8C%90-District-Design-System?node-id=201-119
 */
public enum FontStyle {

    public struct FontSettings {
        let fontSize: CGFloat
        let fontWeight: UIFont.Weight
    }

    // title
    case titleExtraLarge
    case titleLarge
    case titleMedium
    case titleSmall
    case titleExtraSmall

    // body
    case bodyExtraLarge
    case bodyExtraLargeStrong
    case bodyLarge
    case bodyLargeStrong
    case bodyMedium
    case bodyMediumStrong
    case bodySmall
    case bodySmallStrong

    // caption and tiny
    case captionDefault
    case captionDefaultStrong
    case tiny
    case tinyStrong
    case tinyExtraStrong

    // deprecated
    case bodyLargeBold
    case bodySmallMedium
    case captionLarge
    case captionLargeMedium
    case captionLargeSemiStrong
    case captionLargeStrong
    case captionMedium
    case captionSemiStrong
    case captionSmall
    case captionSmallMedium
    case captionSmallStrong
    case tinyMedium
    case captionExtraExtraSmall
    case captionExtraExtraSmallSemiStrong

    public var fontSettings: FontSettings {
        switch self {
        // title
        case .titleExtraLarge: return FontSettings(fontSize: 36, fontWeight: .semibold)
        case .titleLarge: return FontSettings(fontSize: 30, fontWeight: .semibold)
        case .titleMedium: return FontSettings(fontSize: 24, fontWeight: .semibold)
        case .titleSmall: return FontSettings(fontSize: 20, fontWeight: .semibold)
        case .titleExtraSmall: return FontSettings(fontSize: 17, fontWeight: .semibold)
        // body
        case .bodyExtraLarge: return FontSettings(fontSize: 20, fontWeight: .regular)
        case .bodyExtraLargeStrong: return FontSettings(fontSize: 20, fontWeight: .medium)
        case .bodyLarge: return FontSettings(fontSize: 17, fontWeight: .regular)
        case .bodyLargeStrong: return FontSettings(fontSize: 17, fontWeight: .medium)
        case .bodyMedium: return FontSettings(fontSize: 16, fontWeight: .regular)
        case .bodyMediumStrong: return FontSettings(fontSize: 16, fontWeight: .semibold)
        case .bodySmall: return FontSettings(fontSize: 15, fontWeight: .regular)
        case .bodySmallStrong: return FontSettings(fontSize: 15, fontWeight: .semibold)
        // caption and tiny
        case .captionDefault: return FontSettings(fontSize: 13, fontWeight: .regular)
        case .captionDefaultStrong: return FontSettings(fontSize: 13, fontWeight: .semibold)
        case .tiny: return FontSettings(fontSize: 11, fontWeight: .regular)
        case .tinyStrong: return FontSettings(fontSize: 11, fontWeight: .semibold)
        case .tinyExtraStrong: return FontSettings(fontSize: 11, fontWeight: .bold)
        // deprecated
        case .bodySmallMedium: return FontSettings(fontSize: 15, fontWeight: .medium)
        case .bodyLargeBold: return FontSettings(fontSize: 17, fontWeight: .bold)
        case .captionLarge: return FontSettings(fontSize: 14, fontWeight: .regular)
        case .captionLargeMedium: return FontSettings(fontSize: 14, fontWeight: .medium)
        case .captionLargeSemiStrong: return FontSettings(fontSize: 14, fontWeight: .semibold)
        case .captionLargeStrong: return FontSettings(fontSize: 14, fontWeight: .bold)
        case .captionMedium: return FontSettings(fontSize: 13, fontWeight: .medium)
        case .captionSemiStrong: return FontSettings(fontSize: 13, fontWeight: .semibold)
        case .captionSmall: return FontSettings(fontSize: 12, fontWeight: .regular)
        case .captionSmallMedium: return FontSettings(fontSize: 12, fontWeight: .medium)
        case .captionSmallStrong: return FontSettings(fontSize: 12, fontWeight: .bold)
        case .captionExtraExtraSmall: return FontSettings(fontSize: 10, fontWeight: .regular)
        case .captionExtraExtraSmallSemiStrong: return FontSettings(fontSize: 10, fontWeight: .semibold)
        case .tinyMedium: return FontSettings(fontSize: 11, fontWeight: .bold)
        }
    }

    public var fontSize: CGFloat {
        return fontSettings.fontSize
    }

    public var fontWeight: UIFont.Weight {
        return fontSettings.fontWeight
    }

    public var uiFont: UIFont {
        return UIFont.roundedFont(ofSize: fontSize, weight: fontWeight)
    }
}

public extension Font {
    // title
    static let titleExtraLarge = FontStyle.titleExtraLarge.uiFont.toFont()
    static let titleLarge = FontStyle.titleLarge.uiFont.toFont()
    static let titleMedium = FontStyle.titleMedium.uiFont.toFont()
    static let titleSmall = FontStyle.titleSmall.uiFont.toFont()
    static let titleExtraSmall = FontStyle.titleExtraSmall.uiFont.toFont()

    // body
    static let bodyExtraLarge = FontStyle.bodyExtraLarge.uiFont.toFont()
    static let bodyExtraLargeStrong = FontStyle.bodyExtraLargeStrong.uiFont.toFont()
    static let bodyLarge = FontStyle.bodyLarge.uiFont.toFont()
    static let bodyLargeStrong = FontStyle.bodyLargeStrong.uiFont.toFont()
    static let bodyMedium = FontStyle.bodyMedium.uiFont.toFont()
    static let bodyMediumStrong = FontStyle.bodyMediumStrong.uiFont.toFont()
    static let bodySmall = FontStyle.bodySmall.uiFont.toFont()
    static let bodySmallStrong = FontStyle.bodySmallStrong.uiFont.toFont()

    // caption
    static let captionDefault = FontStyle.captionDefault.uiFont.toFont()
    static let captionDefaultStrong = FontStyle.captionDefaultStrong.uiFont.toFont()
    static let tiny = FontStyle.tiny.uiFont.toFont()
    static let tinyStrong = FontStyle.tinyStrong.uiFont.toFont()
    static let tinyExtraStrong = FontStyle.tinyExtraStrong.uiFont.toFont()

    // deprecated
    @available(*, deprecated)
    static let bodyLargeBold = FontStyle.bodyLargeBold.uiFont.toFont()
    @available(*, deprecated)
    static let bodySmallMedium = FontStyle.bodySmallMedium.uiFont.toFont()
    @available(*, deprecated)
    static let captionLarge = FontStyle.captionLarge.uiFont.toFont()
    @available(*, deprecated)
    static let captionLargeMedium = FontStyle.captionLargeMedium.uiFont.toFont()
    @available(*, deprecated)
    static let captionLargeSemiStrong = FontStyle.captionLargeSemiStrong.uiFont.toFont()
    @available(*, deprecated)
    static let captionLargeStrong = FontStyle.captionLargeStrong.uiFont.toFont()
    @available(*, deprecated)
    static let captionSmall = FontStyle.captionSmall.uiFont.toFont()
    @available(*, deprecated)
    static let captionSmallMedium = FontStyle.captionSmallMedium.uiFont.toFont()
    @available(*, deprecated)
    static let captionSmallStrong = FontStyle.captionSmallStrong.uiFont.toFont()
    @available(*, deprecated)
    static let captionSemiStrong = FontStyle.captionSemiStrong.uiFont.toFont()
    @available(*, deprecated)
    static let captionMedium = FontStyle.captionMedium.uiFont.toFont()
    @available(*, deprecated)
    static let tinyMedium = FontStyle.tinyMedium.uiFont.toFont()
    @available(*, deprecated)
    static let captionExtraExtraSmallSemiStrong = FontStyle.captionExtraExtraSmallSemiStrong.uiFont.toFont()
}

public extension UIFont {
    static func roundedFont(ofSize fontSize: CGFloat, weight: UIFont.Weight) -> UIFont {
        let systemFont = UIFont.systemFont(ofSize: fontSize, weight: weight)
        let font: UIFont

        if let descriptor = systemFont.fontDescriptor.withDesign(.rounded) {
            font = UIFont(descriptor: descriptor, size: fontSize)
        } else {
            font = systemFont
        }

        return font
    }

    func toFont() -> SwiftUI.Font {
        return Font(self)
    }
}
