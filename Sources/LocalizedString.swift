//
//  LocalizedString.swift
//  i18nSwift
//
//  Created by Suguru Kishimoto on 3/27/17.
//  Copyright © 2017 Suguru Kishimoto. All rights reserved.
//

import Foundation

public typealias LS = i18n.LocalizedString
extension i18n {
    public struct LocalizedString: RawRepresentable, Equatable, Hashable, Comparable, ExpressibleByStringLiteral {
        public let rawValue: String
        
        public init(rawValue: String) {
            self.rawValue = rawValue
        }
        
        public init(stringLiteral value: String) {
            self.init(rawValue: value)
        }
        
        public init(unicodeScalarLiteral value: String) {
            self.init(rawValue: value)
        }
        
        public init(extendedGraphemeClusterLiteral value: String) {
            self.init(rawValue: value)
        }
        
        public static func ==(lhs: LocalizedString, rhs: LocalizedString) -> Bool {
            return lhs.rawValue == rhs.rawValue
        }
        
        public static func <(lhs: LocalizedString, rhs: LocalizedString) -> Bool {
            return lhs.rawValue < rhs.rawValue
        }
        
        public var hashValue: Int {
            return rawValue.hashValue
        }
    }
}
