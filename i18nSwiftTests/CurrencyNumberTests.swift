//
//  CurrencyNumberTests.swift
//  i18nSwift
//
//  Created by Suguru Kishimoto on 4/1/17.
//  Copyright © 2017 Suguru Kishimoto. All rights reserved.
//

import XCTest
@testable import i18nSwift

class CurrencyNumberTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test() {
        let intValue: Int = 10
        let uintValue: UInt = 10
        let doubleValue: Double = 10.0
        let floatValue: Float = 10.0
        XCTAssertEqual(intValue.number, uintValue.number)
        XCTAssertEqual(intValue.number, doubleValue.number)
        XCTAssertEqual(intValue.number, floatValue.number)
        XCTAssertEqual(uintValue.number, doubleValue.number)
        XCTAssertEqual(uintValue.number, floatValue.number)
        XCTAssertEqual(doubleValue.number, floatValue.number)
    }
}
