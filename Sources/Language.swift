//
//  Language.swift
//  i18nSwift
//
//  Created by Suguru Kishimoto on 3/28/17.
//  Copyright © 2017 Suguru Kishimoto. All rights reserved.
//

import Foundation

public final class Language {
    public struct Constant {
        private init() {}
        public static let currentLanguageKey = "i18n.current_language"
        fileprivate static let defaultLanguage = "en"
        fileprivate static let stringsFileSuffix = "lproj"
        fileprivate static let baseStringsFileName = "Base"
    }
    
    static var dataStore: LanguageDataStore = DefaultLanguageDataStore()
    
    static func localizableBundle(in bundle: Bundle, language: String) -> Bundle? {
        return localizableBundlePath(in: bundle, language: language).flatMap { Bundle(path: $0) }
    }
    
    private static func localizableBundlePath(in bundle: Bundle, language: String = current) -> String? {
        for l in [language, Constant.baseStringsFileName] {
            if let path = bundle.path(forResource: l, ofType: Constant.stringsFileSuffix) {
                return path
            }
        }
        return nil
    }
    
    // MARK: - Language
    
    public static func availableLanguages(_ includeBase: Bool = true, bundle: Bundle = .main) -> [String] {
        return bundle.localizations.filter { $0 != Constant.baseStringsFileName || includeBase }
    }
    
    public static var current: String {
        get {
            return dataStore.language(forKey: Constant.currentLanguageKey) ?? self.default
        }
        set {
            dataStore.set(newValue, forKey: Constant.currentLanguageKey)
        }
    }
    
    public static func reset() {
        dataStore.reset(forKey: Constant.currentLanguageKey)
    }
    
    public static var `default`: String {
        guard let preferredLanguage = Bundle.main.preferredLocalizations.first else {
            return Constant.defaultLanguage
        }
        return availableLanguages().contains(preferredLanguage) ? preferredLanguage : Constant.defaultLanguage
    }
    
    public static func displayName(for language: String) -> String? {
        return NSLocale(localeIdentifier: current).displayName(forKey: .identifier, value: language)
    }

}
