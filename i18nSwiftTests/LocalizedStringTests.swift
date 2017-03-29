//
//  LocalizedStringTests.swift
//  i18nSwift
//
//  Created by Suguru Kishimoto on 3/29/17.
//  Copyright © 2017 Suguru Kishimoto. All rights reserved.
//

import XCTest
@testable import i18nSwift

class LocalizedStringTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test() {
        do {
            let ls1 = LocalizedString(rawValue: "x")
            let ls2 = LocalizedString(rawValue: "x")
            XCTAssertEqual(ls1, ls2)
            XCTAssertEqual(ls1.rawValue, ls2.rawValue)
        }
        
        do {
            let ls1: LocalizedString = LocalizedString(rawValue: "x")
            let ls2: LocalizedString = "x"
            XCTAssertEqual(ls1, ls2)
            
            let ls3: LocalizedString = LocalizedString(unicodeScalarLiteral: "x")
            XCTAssertEqual(ls1, ls3)
            
            let ls4: LocalizedString = LocalizedString(extendedGraphemeClusterLiteral: "x")
            XCTAssertEqual(ls1, ls4)
        }
        
        do {
            let ls1 = LocalizedString(rawValue: "x")
            let ls2 = LocalizedString(rawValue: "x")
            var set: Set<LocalizedString> = [ls1]
            set.insert(ls2)
            XCTAssertEqual(ls1.hashValue, ls2.hashValue)
            XCTAssertEqual(set.count, 1)
        }
        
        do {
            let ls1 = LocalizedString(rawValue: "x")
            let ls2 = LocalizedString(rawValue: "y")
            XCTAssertTrue(ls1 < ls2)
        }
    }
}
