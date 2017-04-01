//
//  NumberFormatterTests.swift
//  i18nSwift
//
//  Created by Suguru Kishimoto on 4/1/17.
//  Copyright © 2017 Suguru Kishimoto. All rights reserved.
//

import XCTest
@testable import i18nSwift

class NumberFormatterTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func test() {
        do {
            let locale = Locale(identifier: "en_US")
            let nf = NumberFormatter(.currency, locale, nil, nil, 3, nil)
            XCTAssertEqual(nf.string(from: 10000.number), "$10,000.00")
        }
        
        do {
            let locale = Locale(identifier: "ja-JP")
            let nf = NumberFormatter(.currency, locale, nil, nil, 3, nil)
            XCTAssertEqual(nf.string(from: 10000.number), "¥10,000")
        }

        do {
            let locale = Locale(identifier: "en_US")
            let nf = NumberFormatter(.currency, locale, "*", "_", 3, (4, 4))
            XCTAssertEqual(nf.string(from: 10000.number), "*10_000.0000")
        }
    }
}
