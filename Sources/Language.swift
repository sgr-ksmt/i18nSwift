//
//  Language.swift
//  i18nSwift
//
//  Created by Suguru Kishimoto on 3/28/17.
//  Copyright © 2017 Suguru Kishimoto. All rights reserved.
//

import Foundation

extension i18n {
    public final class Language {
        public struct Constant {
            internal init() {}
            
            public static let currentLanguageKey = "i18n.current_language"
            fileprivate static let defaultLanguage = "en"
            fileprivate static let stringsFileSuffix = "lproj"
            fileprivate static let baseStringsFileName = "Base"
            fileprivate static let notificationKey = "i18n.current_language.didupdate"
        }
        
        static var dataStore: LanguageDataStore = DefaultLanguageDataStore()
        static var languageBundle: Bundle = .main
        
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
        
        public static func availableLanguages(includeBase: Bool = true) -> [String] {
            return languageBundle.localizations.filter { $0 != Constant.baseStringsFileName || includeBase }
        }
        
        public static var current: String {
            get {
                return dataStore.language(forKey: Constant.currentLanguageKey) ?? self.default
            }
            set {
                let language = availableLanguages().contains(newValue) ? newValue : Constant.defaultLanguage
                dataStore.set(language, forKey: Constant.currentLanguageKey)
                NotificationCenter.default.post(name: .CurrentLanguageDidUpdate, object: nil)
            }
        }
        
        public static func reset() {
            dataStore.reset(forKey: Constant.currentLanguageKey)
            NotificationCenter.default.post(name: .CurrentLanguageDidUpdate, object: nil)
        }
        
        public static var `default`: String {
            return languageBundle.preferredLocalizations.first!
        }
        
        public static func displayName(for language: String = current) -> String? {
            return NSLocale(localeIdentifier: current).displayName(forKey: .identifier, value: language)
        }
        
    }
}

public extension Notification.Name {
    public static let CurrentLanguageDidUpdate = Notification.Name(i18n.Language.Constant.notificationKey)
}

