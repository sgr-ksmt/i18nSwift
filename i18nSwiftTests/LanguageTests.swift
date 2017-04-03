//
//  LanguageTests.swift
//  i18nSwift
//
//  Created by Suguru Kishimoto on 3/30/17.
//  Copyright © 2017 Suguru Kishimoto. All rights reserved.
//

import XCTest
@testable import i18nSwift

class LanguageTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        i18n.Language.dataStore = MockLanguageDataStore()
        i18n.Language.languageBundle = Bundle(for: LanguageTests.self)
    }
    
    override func tearDown() {
        super.tearDown()
        i18n.Language.dataStore.reset(forKey: i18n.Language.Constant.currentLanguageKey)
    }
    
    func testAvailableLanguages() {
        do {
            let availableLanguages = i18n.Language.availableLanguages()
            XCTAssertTrue(availableLanguages.contains("Base"))
            XCTAssertTrue(availableLanguages.contains("en"))
            XCTAssertTrue(availableLanguages.contains("ja"))
            XCTAssertTrue(availableLanguages.contains("fr"))
            XCTAssertEqual(availableLanguages.count, 4)
        }
        
        do {
            let availableLanguages = i18n.Language.availableLanguages(includeBase: false)
            XCTAssertFalse(availableLanguages.contains("Base"))
            XCTAssertTrue(availableLanguages.contains("en"))
            XCTAssertTrue(availableLanguages.contains("ja"))
            XCTAssertTrue(availableLanguages.contains("fr"))
            XCTAssertEqual(availableLanguages.count, 3)
        }
    }
    
    func testCurrentLanguage() {
        XCTAssertNotNil(i18n.Language.Constant())
        
        let defaultLanguage = i18n.Language.default
        XCTAssertEqual(defaultLanguage, i18n.Language.current)
        i18n.Language.current = "fr"
        XCTAssertNotEqual(defaultLanguage, i18n.Language.current)
        XCTAssertEqual(i18n.Language.current, "fr")
        
        i18n.Language.reset()
        XCTAssertNotEqual("fr", i18n.Language.current)
        XCTAssertEqual(defaultLanguage, i18n.Language.current)
        
        i18n.Language.current = "unavailable_language"
        XCTAssertNotEqual("unavailable_language", i18n.Language.current)
        XCTAssertEqual(defaultLanguage, i18n.Language.current)
    }
    
    func testDisplayName() {
        XCTAssertEqual(i18n.Language.displayName(), "English")
        XCTAssertEqual(i18n.Language.displayName(), i18n.Language.displayName(for: "en"))
        i18n.Language.current = "ja"
        XCTAssertEqual(i18n.Language.displayName(), "日本語")
        XCTAssertEqual(i18n.Language.displayName(), i18n.Language.displayName(for: "ja"))
        i18n.Language.current = "Base"
        XCTAssertNil(i18n.Language.displayName())
        XCTAssertEqual(i18n.Language.displayName(), i18n.Language.displayName(for: "Base"))
    }
}
