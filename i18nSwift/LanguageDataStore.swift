//
//  LanguageDataStore.swift
//  i18nSwift
//
//  Created by Suguru Kishimoto on 3/28/17.
//  Copyright © 2017 Suguru Kishimoto. All rights reserved.
//

import Foundation

protocol LanguageDataStore {
    func set(_ language: String, forKey key: String)
    func language(forKey key: String) -> String?
    func reset(forKey key: String)
}

final class DefaultLanguageDataStore: LanguageDataStore {
    func set(_ language: String, forKey key: String) {
        UserDefaults.standard.set(language, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    func language(forKey key: String) -> String? {
        return UserDefaults.standard.string(forKey: key)
    }
    
    func reset(forKey key: String) {
        UserDefaults.standard.removeObject(forKey: key)
        UserDefaults.standard.synchronize()
    }
}
