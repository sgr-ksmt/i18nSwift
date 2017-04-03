//
//  I18nTests.swift
//  i18nSwift
//
//  Created by Suguru Kishimoto on 4/1/17.
//  Copyright © 2017 Suguru Kishimoto. All rights reserved.
//

import XCTest
@testable import i18nSwift

extension i18n.LocalizedString {
    static let helloWorld: i18n.LocalizedString = "hello_world"
    static let haveFlowers: i18n.LocalizedString = "have_flowers"
    static let test: i18n.LocalizedString = "test"
}

class I18nTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        i18n.Language.languageBundle = Bundle(for: I18nTests.self)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testLocalize() {
        
        XCTAssertNotNil(i18n())
        let testBundle = Bundle(for: I18nTests.self)
        i18n.Language.current = "en"
        XCTAssertEqual(i18n.t(.helloWorld, bundle: testBundle), "Hello, World!")
        XCTAssertEqual(i18n.t("hello_world", bundle: testBundle), "Hello, World!")
        
        XCTAssertEqual(i18n.t(.haveFlowers, bundle: testBundle, args: 3), "I have 3 flowers.")
        XCTAssertEqual(i18n.t("have_flowers", bundle: testBundle, args: 3), "I have 3 flowers.")
        
        XCTAssertEqual(i18n.t(.test, bundle: testBundle), "test")
        XCTAssertEqual(i18n.t(.test, tableName: "Test", bundle: testBundle), "test!!!")
        XCTAssertEqual(i18n.t("test", tableName: "Test", bundle: testBundle), "test!!!")
        
        XCTAssertEqual(i18n.t(.helloWorld), "hello_world")
        XCTAssertEqual(i18n.t("invalid_key"), "invalid_key")
        XCTAssertEqual(i18n.t("invalid_key", bundle: testBundle), "invalid_key")
        
        
        i18n.Language.current = "ja"
        XCTAssertEqual(i18n.t(.helloWorld, bundle: testBundle), "こんにちは、世界")
        XCTAssertEqual(i18n.t("hello_world", bundle: testBundle), "こんにちは、世界")
        
        XCTAssertEqual(i18n.t(.haveFlowers, bundle: testBundle, args: 3), "私は3本の花を持っています")
        XCTAssertEqual(i18n.t("have_flowers", bundle: testBundle, args: 3), "私は3本の花を持っています")
        
        XCTAssertEqual(i18n.t(.test, bundle: testBundle), "test")
        XCTAssertEqual(i18n.t(.test, tableName: "Test", bundle: testBundle), "テスト!!!")
        XCTAssertEqual(i18n.t("test", tableName: "Test", bundle: testBundle), "テスト!!!")

        XCTAssertEqual(i18n.t(.helloWorld), "hello_world")
        XCTAssertEqual(i18n.t("invalid_key"), "invalid_key")
        XCTAssertEqual(i18n.t("invalid_key", bundle: testBundle), "invalid_key")

        
        i18n.Language.current = "Base"
        XCTAssertEqual(i18n.t(.helloWorld, bundle: testBundle), "Hello, World!")
        XCTAssertEqual(i18n.t("hello_world", bundle: testBundle), "Hello, World!")
        
        XCTAssertEqual(i18n.t(.haveFlowers, bundle: testBundle, args: 3), "I have 3 flowers.")
        XCTAssertEqual(i18n.t("have_flowers", bundle: testBundle, args: 3), "I have 3 flowers.")
        
        XCTAssertEqual(i18n.t(.test, bundle: testBundle), "test")
        XCTAssertEqual(i18n.t(.test, tableName: "Test", bundle: testBundle), "test!!!")
        XCTAssertEqual(i18n.t("test", tableName: "Test", bundle: testBundle), "test!!!")

        XCTAssertEqual(i18n.t(.helloWorld), "hello_world")
        XCTAssertEqual(i18n.t("invalid_key"), "invalid_key")
        XCTAssertEqual(i18n.t("invalid_key", bundle: testBundle), "invalid_key")

        
        i18n.Language.current = "fr"
        XCTAssertEqual(i18n.t(.helloWorld, bundle: testBundle), "Bonjour le monde.")
        XCTAssertEqual(i18n.t("hello_world", bundle: testBundle), "Bonjour le monde.")
        
        XCTAssertEqual(i18n.t(.haveFlowers, bundle: testBundle, args: 3), "J'ai 3 fleurs.")
        XCTAssertEqual(i18n.t("have_flowers", bundle: testBundle, args: 3), "J'ai 3 fleurs.")
        
        XCTAssertEqual(i18n.t(.test, bundle: testBundle), "test")
        XCTAssertEqual(i18n.t(.test, tableName: "Test", bundle: testBundle), "test!!!")
        XCTAssertEqual(i18n.t("test", tableName: "Test", bundle: testBundle), "test!!!")

        XCTAssertEqual(i18n.t(.helloWorld), "hello_world")
        XCTAssertEqual(i18n.t("invalid_key"), "invalid_key")
        XCTAssertEqual(i18n.t("invalid_key", bundle: testBundle), "invalid_key")

    }
    
    func testCurrency() {
        XCTAssertEqual(i18n.currency(10000, Locale(identifier: "en_US")), "$10,000.00")
        XCTAssertEqual(i18n.currency(10000, Locale(identifier: "en_US"), symbol: "*"), "*10,000.00")
        XCTAssertEqual(i18n.currency(10000, Locale(identifier: "en_US"), separator: "_"), "$10_000.00")
        XCTAssertEqual(i18n.currency(10000, Locale(identifier: "en_US"), grouping: 2), "$1,00,00.00")
        XCTAssertEqual(i18n.currency(10000, Locale(identifier: "en_US"), fractionDigits: (4, 4)), "$10,000.0000")

        XCTAssertEqual(i18n.currencyISO(10000, Locale(identifier: "en_US")), "USD10,000.00")
        XCTAssertEqual(i18n.currencyISO(10000, Locale(identifier: "en_US"), separator: "_"), "USD10_000.00")
        XCTAssertEqual(i18n.currencyISO(10000, Locale(identifier: "en_US"), grouping: 2), "USD1,00,00.00")
        XCTAssertEqual(i18n.currencyISO(10000, Locale(identifier: "en_US"), fractionDigits: (4, 4)), "USD10,000.0000")

    }
}
