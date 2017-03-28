//
//  NumberFormatter+Ex.swift
//  i18nSwift
//
//  Created by Suguru Kishimoto on 3/28/17.
//  Copyright © 2017 Suguru Kishimoto. All rights reserved.
//

import Foundation

extension NumberFormatter {
    convenience init(_ style: NumberFormatter.Style, _ locale: Locale, _ symbol: String?, _ separator: String?, _ grouping: Int, _ fractionDigits: FractionDigits?) {
        self.init()
        self.numberStyle = style
        self.locale = locale
        self.currencySymbol = symbol
        self.currencyGroupingSeparator = separator
        self.groupingSize = grouping
        if let fractionDigits = fractionDigits {
            self.minimumFractionDigits = fractionDigits.min
            self.maximumFractionDigits = fractionDigits.max
        }
    }
}
