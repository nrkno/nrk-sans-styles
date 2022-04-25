import Foundation
import UIKit

public extension FontStyle {
    public var uiFontWeight: UIFont.Weight {
        let anchors: [(Int, Float)] = [
            (100, -0.8),
            (150, -0.6),
            (300, -0.4),
            (400, 0),
            (600, 0.3),
            (700, 0.4),
            (800, 0.56),
            (900, 0.62)
        ]

        let intWeight = Int(fontWeight)
        var lowerAnchor: Int = 0
        while lowerAnchor + 1 < anchors.count &&
              (intWeight < anchors[lowerAnchor].0 || intWeight >= anchors[lowerAnchor + 1].0) {
            lowerAnchor += 1
        }

        let lower = anchors[lowerAnchor]
        let upper = anchors[lowerAnchor + 1]

        let delta = Float(intWeight - lower.0) / (Float(upper.0 - lower.0))
        let weightValue = lower.1 + ((upper.1 - lower.1) * delta)
        return UIFont.Weight(rawValue: CGFloat(weightValue))
    }

    public var kerning: CGFloat? {
        guard let letterSpacingEm = letterSpacingEm else { return nil }
        return pointSize * letterSpacingEm
    }
}

