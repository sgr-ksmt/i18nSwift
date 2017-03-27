//
//  i18n.swift
//  i18nSwift
//
//  Created by Suguru Kishimoto on 3/27/17.
//  Copyright © 2017 Suguru Kishimoto. All rights reserved.
//

import Foundation

//TODO: number
//TODO: currency
//TODO: percentage
//TODO: locale


public final class I18n {
    private init() {}
    
    public static func t(_ key: Localizable, _ language: String = currentLanguage, tableName: String? = nil, bundle: Bundle = Bundle.main) -> String {
        return localizedBundlePath(for: bundle, language: language)
            .flatMap { Bundle(path: $0) }
            .map { $0.localizedString(forKey: key.rawValue, value: nil, table: tableName) } ?? key.rawValue
    }
    
    public static func t(_ key: Localizable, _ language: String = currentLanguage, tableName: String? = nil, bundle: Bundle = Bundle.main, args: CVarArg...) -> String {
        return String(format: t(key, language, tableName: tableName, bundle: bundle), arguments: args)
    }
    
    private static func localizedBundlePath(for bundle: Bundle, language: String) -> String? {
        for l in [language, Constant.baseStringsFileName] {
            if let path = bundle.path(forResource: l, ofType: Constant.stringsFileSuffix) {
                return path
            }
        }
        return nil
    }
}

extension I18n {
    public struct Constant {
        private init() {}
        public static let currentLanguageKey = "i18n.current_language"
        fileprivate static let defaultLanguage = "en"
        fileprivate static let stringsFileSuffix = "lproj"
        fileprivate static let baseStringsFileName = "Base"
    }
}

// MARK: - Language
extension I18n {
    public static func availableLanguages(_ includeBase: Bool = true) -> [String] {
        return Bundle.main.localizations.filter { $0 != Constant.baseStringsFileName || includeBase }
    }
    
    //TODO: userdefault->mock
    public static var currentLanguage: String {
        get {
            return UserDefaults.standard.string(forKey: Constant.currentLanguageKey) ?? defaultLanguage
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Constant.currentLanguageKey)
            UserDefaults.standard.synchronize()
        }
    }
    
    public static func resetCurrentLanguage() {
        UserDefaults.standard.removeObject(forKey: Constant.currentLanguageKey)
        UserDefaults.standard.synchronize()
    }
    
    public static var defaultLanguage: String {
        guard let preferredLanguage = Bundle.main.preferredLocalizations.first else {
            return Constant.defaultLanguage
        }
        return availableLanguages().contains(preferredLanguage) ? preferredLanguage : Constant.defaultLanguage
    }
    
    public static func displayName(for language: String) -> String? {
        return NSLocale(localeIdentifier: currentLanguage).displayName(forKey: .identifier, value: language)
    }
}
