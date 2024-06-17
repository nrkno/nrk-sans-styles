/**
 * AUTOMATICALLY GENERATED FILE
 *
 * This file has been automatically generated.
 */

import Foundation
import UIKit

#if os(iOS)
public enum FontStyle: Hashable, CaseIterable, Sendable {
    case largeTitle
    case title1
    case title2
    case title3
    case preamble
    case headline
    case body
    case callout
    case subhead1
    case subhead2
    case footnote
    case caption1
    case caption2
    case label
    case icon
    case iconLarge

    public var fontStyle: UIFont.TextStyle {
        switch self {
        case .largeTitle:
            return .title1
        case .title1:
            return .title1
        case .title2:
            return .title2
        case .title3:
            return .title3
        case .preamble:
            return .body
        case .headline:
            return .headline
        case .body:
            return .body
        case .callout:
            return .callout
        case .subhead1:
            return .subheadline
        case .subhead2:
            return .subheadline
        case .footnote:
            return .footnote
        case .caption1:
            return .caption1
        case .caption2:
            return .caption2
        case .label:
            return .subheadline
        case .icon:
            return .subheadline
        case .iconLarge:
            return .subheadline
        }
    }

    public var fontWeight: CGFloat {
        switch self {
        case .largeTitle:
            return 800
        case .title1:
            return 800
        case .title2:
            return 800
        case .title3:
            return 800
        case .preamble:
            return 400
        case .headline:
            return 660
        case .body:
            return 400
        case .callout:
            return 400
        case .subhead1:
            return 660
        case .subhead2:
            return 400
        case .footnote:
            return 400
        case .caption1:
            return 660
        case .caption2:
            return 400
        case .label:
            return 660
        case .icon:
            return 660
        case .iconLarge:
            return 660
        }
    }

    public var pointSize: CGFloat {
        switch self {
        case .largeTitle:
            return 37
        case .title1:
            return 28
        case .title2:
            return 22
        case .title3:
            return 19
        case .preamble:
            return 20
        case .headline:
            return 17
        case .body:
            return 17
        case .callout:
            return 16
        case .subhead1:
            return 15
        case .subhead2:
            return 15
        case .footnote:
            return 13
        case .caption1:
            return 12
        case .caption2:
            return 11
        case .label:
            return 11
        case .icon:
            return 11
        case .iconLarge:
            return 13
        }
    }

    public var lineHeightEm: CGFloat? {
        switch self {
        case .largeTitle:
            return 1.2
        case .title1:
            return 1.2
        case .title2:
            return 1.25
        case .title3:
            return 1.25
        case .preamble:
            return 1.3
        case .headline:
            return 1.25
        case .body:
            return 1.4
        case .callout:
            return 1.35
        case .subhead1:
            return 1.2
        case .subhead2:
            return 1.2
        case .footnote:
            return 1.35
        case .caption1:
            return 1.3
        case .caption2:
            return 1.3
        case .label:
            return 1.1
        case .icon:
            return 0.74
        case .iconLarge:
            return 0.74
        }
    }

    public var letterSpacingEm: CGFloat? {
        switch self {
        case .largeTitle:
            return 0.02
        case .title1:
            return 0.02
        case .title2:
            return 0.014
        case .title3:
            return 0.015
        case .preamble:
            return -0.01
        case .headline:
            return 0.0075
        case .body:
            return nil
        case .callout:
            return nil
        case .subhead1:
            return 0.015
        case .subhead2:
            return nil
        case .footnote:
            return 0.0025
        case .caption1:
            return 0.0125
        case .caption2:
            return nil
        case .label:
            return nil
        case .icon:
            return 0.0025
        case .iconLarge:
            return 0.0025
        }
    }
}
#elseif os(tvOS)
public enum FontStyle: Hashable, CaseIterable, Sendable {
    case largeTitle
    case title1
    case title2
    case title3
    case preamble
    case headline
    case body
    case callout
    case subhead1
    case subhead2
    case footnote
    case caption1
    case caption2
    case label
    case icon
    case iconLarge

    public var fontStyle: UIFont.TextStyle {
        switch self {
        case .largeTitle:
            return .title1
        case .title1:
            return .title1
        case .title2:
            return .title2
        case .title3:
            return .title3
        case .preamble:
            return .body
        case .headline:
            return .headline
        case .body:
            return .body
        case .callout:
            return .callout
        case .subhead1:
            return .subheadline
        case .subhead2:
            return .subheadline
        case .footnote:
            return .footnote
        case .caption1:
            return .caption1
        case .caption2:
            return .caption2
        case .label:
            return .subheadline
        case .icon:
            return .subheadline
        case .iconLarge:
            return .subheadline
        }
    }

    public var fontWeight: CGFloat {
        switch self {
        case .largeTitle:
            return 800
        case .title1:
            return 800
        case .title2:
            return 800
        case .title3:
            return 800
        case .preamble:
            return 400
        case .headline:
            return 660
        case .body:
            return 400
        case .callout:
            return 400
        case .subhead1:
            return 660
        case .subhead2:
            return 400
        case .footnote:
            return 400
        case .caption1:
            return 660
        case .caption2:
            return 400
        case .label:
            return 660
        case .icon:
            return 660
        case .iconLarge:
            return 660
        }
    }

    public var pointSize: CGFloat {
        switch self {
        case .largeTitle:
            return 75
        case .title1:
            return 75
        case .title2:
            return 56
        case .title3:
            return 47
        case .preamble:
            return 42
        case .headline:
            return 36
        case .body:
            return 29
        case .callout:
            return 31
        case .subhead1:
            return 29
        case .subhead2:
            return 29
        case .footnote:
            return 29
        case .caption1:
            return 25
        case .caption2:
            return 23
        case .label:
            return 23
        case .icon:
            return 20
        case .iconLarge:
            return 31
        }
    }

    public var lineHeightEm: CGFloat? {
        switch self {
        case .largeTitle:
            return 1.15
        case .title1:
            return 1.15
        case .title2:
            return 1.15
        case .title3:
            return 1.2
        case .preamble:
            return 1.3
        case .headline:
            return 1.25
        case .body:
            return 1.35
        case .callout:
            return 1.35
        case .subhead1:
            return 1.2
        case .subhead2:
            return 1.2
        case .footnote:
            return 1.3
        case .caption1:
            return 1.3
        case .caption2:
            return 1.35
        case .label:
            return 1.2
        case .icon:
            return 0.68
        case .iconLarge:
            return 0.68
        }
    }

    public var letterSpacingEm: CGFloat? {
        switch self {
        case .largeTitle:
            return nil
        case .title1:
            return nil
        case .title2:
            return nil
        case .title3:
            return nil
        case .preamble:
            return -0.002
        case .headline:
            return nil
        case .body:
            return -0.002
        case .callout:
            return -0.002
        case .subhead1:
            return 0.004
        case .subhead2:
            return -0.002
        case .footnote:
            return -0.002
        case .caption1:
            return nil
        case .caption2:
            return -0.002
        case .label:
            return nil
        case .icon:
            return 0.0025
        case .iconLarge:
            return 0.0025
        }
    }
}
#endif

