//
//  i18n.swift
//  i18nSwift
//
//  Created by Suguru Kishimoto on 3/27/17.
//  Copyright © 2017 Suguru Kishimoto. All rights reserved.
//

import Foundation

public final class I18n {
    private init() {}
    
    public static func t(_ key: Localizable, tableName: String? = nil, bundle: Bundle = Bundle.main) -> String {
        return NSLocalizedString(key.rawValue, tableName: tableName, bundle: bundle, comment: "")
    }
    
    public static func t(_ key: Localizable, tableName: String? = nil, bundle: Bundle = Bundle.main, args: CVarArg...) -> String {
        return String(format: t(key, tableName: tableName, bundle: bundle), arguments: args)
    }
}
