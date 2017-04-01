//
//  LanguageObserverTests.swift
//  i18nSwift
//
//  Created by Suguru Kishimoto on 4/1/17.
//  Copyright © 2017 Suguru Kishimoto. All rights reserved.
//

import XCTest
@testable import i18nSwift

class LanguageObserverTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        observer = nil
        Language.dataStore = MockLanguageDataStore()
        Language.languageBundle = Bundle(for: LanguageTests.self)
    }
    
    override func tearDown() {
        super.tearDown()
        observer = nil
    }
    
    private var observer: LanguageObserver!
    
    func testEnabled() {
        let ex = expectation(description: #function)
        
        observer = LanguageObserver { language in
            XCTAssertEqual(language, "fr")
            ex.fulfill()
        }
        
        Language.current = "fr"
        
        waitForExpectations(timeout: 0.5) { _ in
        }
    }
    
    func testDisabled() {
        let ex = expectation(description: #function)
        
        observer = LanguageObserver { _ in
            XCTFail()
        }
        observer.isEnabled = false
        
        Language.current = "fr"
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            ex.fulfill()
        }
        
        waitForExpectations(timeout: 0.5) { _ in
        }
    }
    
    func testMixed() {
        let ex = expectation(description: #function)
        
        observer = LanguageObserver { language in
            XCTAssertEqual(language, "ja")
            ex.fulfill()
        }
        
        observer.isEnabled = false
        
        Language.current = "fr"
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [unowned self] in
            self.observer.isEnabled = true
            Language.current = "ja"
        }
        
        waitForExpectations(timeout: 0.5) { _ in
        }
    }

}
