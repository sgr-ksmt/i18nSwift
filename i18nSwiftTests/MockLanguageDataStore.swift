//
//  MockLanguageDataStore.swift
//  i18nSwift
//
//  Created by Suguru Kishimoto on 3/29/17.
//  Copyright © 2017 Suguru Kishimoto. All rights reserved.
//

import Foundation
@testable import i18nSwift

class MockLanguageDataStore: LanguageDataStore {
    private var dataStore: [String: String] = [:]
    func set(_ language: String, forKey key: String) {
        dataStore[key] = language
    }
    
    func language(forKey key: String) -> String? {
        return dataStore[key]
    }
    
    func reset(forKey key: String) {
        dataStore[key] = nil
    }
}
