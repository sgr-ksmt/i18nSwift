//
//  LanguageObserver.swift
//  i18nSwift
//
//  Created by Suguru Kishimoto on 4/1/17.
//  Copyright © 2017 Suguru Kishimoto. All rights reserved.
//

import Foundation

public class LanguageObserver {
    public typealias Handler = (String) -> Void
    private let handler: Handler
    var isEnabled: Bool = true
    public init(_ handler: @escaping Handler) {
        self.handler = handler
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(currentLanguageDidUpdate(_:)),
            name: .CurrentLanguageDidUpdate,
            object: nil
        )
    }
    
    @objc private func currentLanguageDidUpdate(_: Notification) {
        if isEnabled {
            handler(Language.current)
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
