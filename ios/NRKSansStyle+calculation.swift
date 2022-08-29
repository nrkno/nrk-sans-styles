import Foundation
import UIKit

public extension FontStyle {
    var uiFontWeight: UIFont.Weight {
        /// The relationship between the "standard" font weights (the ones that are
        /// used by Figma, web, and Android) and the font weights used by iOS are
        /// not linear. Because the relationship is unknown, we approximate the
        /// value by interpolating between the closest known anchors.
        ///
        /// Note that even the anchors themselves are not necessarily correct. They
        /// SEEM to be correct, based on the following correlation between `UIFont.Weight`,
        /// `UIFont.Weight.rawValue`, figma weights, and `UIImage.SymbolWeight` - in
        /// addition to manual inspection of course.
        ///
        ///  UIFont.Weight   rawValue    Figma    UIImage.SymbolWeight
        ///  ----------------------------------------------------------
        ///  ultraLight      -0.8        100        1
        ///  thin            -0.6        150        2
        ///  light           -0.4        300        3
        ///  regular          0          400        4
        ///  semibold         0.3        600        5
        ///  bold             0.4        700        6
        ///  heavy            0.56       800        7
        ///  black            0.62       900        8
        ///
        /// The anchor-array maps from standard font weights to 'UIFont.Weight'.
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
        let upper = (lowerAnchor + 1 < anchors.count) ? anchors[lowerAnchor + 1] : lower

        let delta = Float(intWeight - lower.0) / (Float(upper.0 - lower.0))
        let weightValue = lower.1 + ((upper.1 - lower.1) * delta)
        return UIFont.Weight(rawValue: CGFloat(weightValue))
    }

    var lineHeightMultiple: CGFloat? {
        /// The NSAttributedString property 'lineHeightMultiple' is a multiple
        /// of the **DEFAULT** line height, embedded in the font. For NRK Sans, the
        /// default line height is 120% of the point size. So the lineHeightMultiple
        /// property is a factor on 120%. If *NO* space between the lines is desired,
        /// lineHeightMultiple must be 0.833, because 0.833 * 120 = 100.
        guard let lineHeightEm = lineHeightEm else { return nil }
        return lineHeightEm / 1.2
    }

    var kerning: CGFloat? {
        /// Kerning/tracking/letter spacing is also using a custom value on iOS (I hope
        /// you're not surprised at this point). Where other platforms use an 'em' property,
        /// iOS uses a value that's fixed to the point size. Multiply the point size with the
        /// 'letter spacing em', and you get the correct kerning value.
        guard let letterSpacingEm = letterSpacingEm else { return nil }
        return pointSize * letterSpacingEm
    }
}

