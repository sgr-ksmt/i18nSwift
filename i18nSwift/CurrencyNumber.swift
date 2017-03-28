//
//  CurrencyNumber.swift
//  i18nSwift
//
//  Created by Suguru Kishimoto on 3/28/17.
//  Copyright © 2017 Suguru Kishimoto. All rights reserved.
//

import Foundation

public protocol CurrencyNumber {
    var number: NSNumber { get }
}

extension Int: CurrencyNumber {
    public var number: NSNumber {
        return NSNumber.init(value: self)
    }
}

extension UInt: CurrencyNumber {
    public var number: NSNumber {
        return NSNumber.init(value: self)
    }
}

extension Double: CurrencyNumber {
    public var number: NSNumber {
        return NSNumber.init(value: self)
    }
}

extension Float: CurrencyNumber {
    public var number: NSNumber {
        return NSNumber.init(value: self)
    }
}
