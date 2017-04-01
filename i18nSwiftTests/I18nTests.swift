//
//  I18nTests.swift
//  i18nSwift
//
//  Created by Suguru Kishimoto on 4/1/17.
//  Copyright © 2017 Suguru Kishimoto. All rights reserved.
//

import XCTest
@testable import i18nSwift

extension LocalizedString {
    static let helloWorld: LocalizedString = "hello_world"
    static let haveFlowers: LocalizedString = "have_flowers"
}

class I18nTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testLocalize() {
        let testBundle = Bundle(for: I18nTests.self)
        Language.current = "en"
        XCTAssertEqual(I18n.t(.helloWorld, bundle: testBundle), "Hello, World!")
        XCTAssertEqual(I18n.t("hello_world", bundle: testBundle), "Hello, World!")
        XCTAssertEqual(I18n.t(.haveFlowers, bundle: testBundle, args: 3), "I have 3 flowers.")
        XCTAssertEqual(I18n.t("have_flowers", bundle: testBundle, args: 3), "I have 3 flowers.")
        XCTAssertEqual(I18n.t(.helloWorld), "hello_world")
        XCTAssertEqual(I18n.t("invalid_key"), "invalid_key")
        XCTAssertEqual(I18n.t("invalid_key", bundle: testBundle), "invalid_key")
        
        Language.current = "ja"
        XCTAssertEqual(I18n.t(.helloWorld, bundle: testBundle), "こんにちは、世界")
        XCTAssertEqual(I18n.t("hello_world", bundle: testBundle), "こんにちは、世界")
        XCTAssertEqual(I18n.t(.haveFlowers, bundle: testBundle, args: 3), "私は3本の花を持っています")
        XCTAssertEqual(I18n.t("have_flowers", bundle: testBundle, args: 3), "私は3本の花を持っています")
        XCTAssertEqual(I18n.t(.helloWorld), "hello_world")
        XCTAssertEqual(I18n.t("invalid_key"), "invalid_key")
        XCTAssertEqual(I18n.t("invalid_key", bundle: testBundle), "invalid_key")

        Language.current = "Base"
        XCTAssertEqual(I18n.t(.helloWorld, bundle: testBundle), "Hello, World!")
        XCTAssertEqual(I18n.t("hello_world", bundle: testBundle), "Hello, World!")
        XCTAssertEqual(I18n.t(.haveFlowers, bundle: testBundle, args: 3), "I have 3 flowers.")
        XCTAssertEqual(I18n.t("have_flowers", bundle: testBundle, args: 3), "I have 3 flowers.")
        XCTAssertEqual(I18n.t(.helloWorld), "hello_world")
        XCTAssertEqual(I18n.t("invalid_key"), "invalid_key")
        XCTAssertEqual(I18n.t("invalid_key", bundle: testBundle), "invalid_key")

        Language.current = "fr"
        XCTAssertEqual(I18n.t(.helloWorld, bundle: testBundle), "Bonjour le monde.")
        XCTAssertEqual(I18n.t("hello_world", bundle: testBundle), "Bonjour le monde.")
        XCTAssertEqual(I18n.t(.haveFlowers, bundle: testBundle, args: 3), "J'ai 3 fleurs.")
        XCTAssertEqual(I18n.t("have_flowers", bundle: testBundle, args: 3), "J'ai 3 fleurs.")
        XCTAssertEqual(I18n.t(.helloWorld), "hello_world")
        XCTAssertEqual(I18n.t("invalid_key"), "invalid_key")
        XCTAssertEqual(I18n.t("invalid_key", bundle: testBundle), "invalid_key")

    }
    
    func testCurrency() {
        XCTAssertEqual(I18n.currency(10000, Locale(identifier: "en_US")), "$10,000.00")
        XCTAssertEqual(I18n.currency(10000, Locale(identifier: "en_US"), symbol: "*"), "*10,000.00")
        XCTAssertEqual(I18n.currency(10000, Locale(identifier: "en_US"), separator: "_"), "$10_000.00")
        XCTAssertEqual(I18n.currency(10000, Locale(identifier: "en_US"), grouping: 2), "$1,00,00.00")
        XCTAssertEqual(I18n.currency(10000, Locale(identifier: "en_US"), fractionDigits: (4, 4)), "$10,000.0000")

        XCTAssertEqual(I18n.currencyISO(10000, Locale(identifier: "en_US")), "USD10,000.00")
        XCTAssertEqual(I18n.currencyISO(10000, Locale(identifier: "en_US"), separator: "_"), "USD10_000.00")
        XCTAssertEqual(I18n.currencyISO(10000, Locale(identifier: "en_US"), grouping: 2), "USD1,00,00.00")
        XCTAssertEqual(I18n.currencyISO(10000, Locale(identifier: "en_US"), fractionDigits: (4, 4)), "USD10,000.0000")

    }
}
