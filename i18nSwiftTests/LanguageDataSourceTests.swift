//
//  LanguageDataSourceTests.swift
//  i18nSwift
//
//  Created by Suguru Kishimoto on 3/29/17.
//  Copyright © 2017 Suguru Kishimoto. All rights reserved.
//

import XCTest
@testable import i18nSwift

class LanguageDataSourceTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        UserDefaults.standard.removePersistentDomain(forName: Bundle(for: type(of: self)).bundleIdentifier!)
    }
    
    func testDataStore() {
        let dataStore = DefaultLanguageDataStore()
        let key = i18n.Language.Constant.currentLanguageKey
        dataStore.set("en", forKey: key)
        XCTAssertEqual(dataStore.language(forKey: key), "en")
        
        dataStore.set("fr", forKey: key)
        XCTAssertEqual(dataStore.language(forKey: key), "fr")
        
        let wrongKey = "wrong_key"
        dataStore.reset(forKey: wrongKey)
        XCTAssertNotNil(dataStore.language(forKey: key))
        
        dataStore.reset(forKey: key)
        XCTAssertNil(dataStore.language(forKey: key))
        UIButton(frame: .zero).setTitle(<#T##title: String?##String?#>, for: <#T##UIControlState#>)
    }
    
    func testMockDataStore() {
        let dataStore = MockLanguageDataStore()
        let key = i18n.Language.Constant.currentLanguageKey
        dataStore.set("en", forKey: key)
        XCTAssertEqual(dataStore.language(forKey: key), "en")
        
        dataStore.set("fr", forKey: key)
        XCTAssertEqual(dataStore.language(forKey: key), "fr")
        
        let wrongKey = "wrong_key"
        dataStore.reset(forKey: wrongKey)
        XCTAssertNotNil(dataStore.language(forKey: key))
        
        dataStore.reset(forKey: key)
        XCTAssertNil(dataStore.language(forKey: key))
    }
}
