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
        Language.dataStore = MockLanguageDataStore()
        Language.languageBundle = Bundle(for: LanguageTests.self)
    }
    
    override func tearDown() {
        super.tearDown()
        Language.dataStore.reset(forKey: Language.Constant.currentLanguageKey)
    }
    
    func testAvailableLanguages() {
        do {
            let availableLanguages = Language.availableLanguages()
            XCTAssertTrue(availableLanguages.contains("Base"))
            XCTAssertTrue(availableLanguages.contains("en"))
            XCTAssertTrue(availableLanguages.contains("ja"))
            XCTAssertTrue(availableLanguages.contains("fr"))
            XCTAssertEqual(availableLanguages.count, 4)
        }
        
        do {
            let availableLanguages = Language.availableLanguages(includeBase: false)
            XCTAssertFalse(availableLanguages.contains("Base"))
            XCTAssertTrue(availableLanguages.contains("en"))
            XCTAssertTrue(availableLanguages.contains("ja"))
            XCTAssertTrue(availableLanguages.contains("fr"))
            XCTAssertEqual(availableLanguages.count, 3)
        }
    }
    
    func testCurrentLanguage() {
        let defaultLanguage = Language.default
        XCTAssertEqual(defaultLanguage, Language.current)
        Language.current = "fr"
        XCTAssertNotEqual(defaultLanguage, Language.current)
        XCTAssertEqual(Language.current, "fr")
        
        Language.reset()
        XCTAssertNotEqual("fr", Language.current)
        XCTAssertEqual(defaultLanguage, Language.current)
        
        Language.current = "unavailable_language"
        XCTAssertNotEqual("unavailable_language", Language.current)
        XCTAssertEqual(defaultLanguage, Language.current)
    }
    
    func testDisplayName() {
        XCTAssertEqual(Language.displayName(), "English")
        XCTAssertEqual(Language.displayName(), Language.displayName(for: "en"))
        Language.current = "ja"
        XCTAssertEqual(Language.displayName(), "日本語")
        XCTAssertEqual(Language.displayName(), Language.displayName(for: "ja"))
        Language.current = "Base"
        XCTAssertNil(Language.displayName())
        XCTAssertEqual(Language.displayName(), Language.displayName(for: "Base"))
    }
}
