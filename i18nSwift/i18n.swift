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
    
    // MARK: - Localize
    
    public static func t(_ key: LocalizedString, _ language: String = Language.current, tableName: String? = nil, bundle: Bundle = .main) -> String {
        return Language
            .localizableBundle(in: bundle, language: language)
            .map { $0.localizedString(forKey: key.rawValue, value: nil, table: tableName) } ?? key.rawValue
    }
    
    public static func t(_ key: LocalizedString, _ language: String = Language.current, tableName: String? = nil, bundle: Bundle = .main, args: CVarArg...) -> String {
        return String(format: t(key, language, tableName: tableName, bundle: bundle), arguments: args)
    }
    
    
    // MARK: - currency
    
}
