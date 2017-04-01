//
//  ViewController.swift
//  Demo
//
//  Created by Suguru Kishimoto on 3/26/17.
//  Copyright © 2017 Suguru Kishimoto. All rights reserved.
//

import UIKit
import i18nSwift

class ViewController: UIViewController {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var alertButton: UIButton! {
        didSet {
            alertButton.addTarget(self, action: #selector(alertButtonDidTap(_:)), for: .touchUpInside)
        }
    }
    @IBOutlet private weak var selectLanguageButton: UIButton! {
        didSet {
            selectLanguageButton.addTarget(self, action: #selector(selectLanguageButtonDidTap(_:)), for: .touchUpInside)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    func update() {
        titleLabel.text = Language.displayName()
        alertButton.setTitle(i18n.t(.alertButton), for: [])
        selectLanguageButton.setTitle(i18n.t(.chooseLanguage), for: [])
    }
    
    @objc private func alertButtonDidTap(_: UIButton) {
        let alert = UIAlertController(title: i18n.t(.alertTitle), message: i18n.t(.alertMessage), preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: i18n.t(.ok) , style: .default) { _ in })
        show(alert, sender: nil)
    }
    
    @objc private func selectLanguageButtonDidTap(_: UIButton) {
        let actionSheet = UIAlertController(title: nil, message: i18n.t(.chooseLanguage), preferredStyle: .actionSheet)
        
        Language.availableLanguages(includeBase: false).forEach { language in
            let title = Language.displayName(for: language).map { Language.current == language ? "\($0) ✔︎" : $0 } ?? ""
            actionSheet.addAction(UIAlertAction(title: title, style: .default) { _ in
                Language.current = language
            })
        }
        
        actionSheet.addAction(UIAlertAction(title: i18n.t(.useSystem), style: .destructive) { _ in
            Language.reset()
        })
        actionSheet.addAction(UIAlertAction(title: i18n.t(.cancel), style: .cancel) { _ in })
        show(actionSheet, sender: nil)
    }
}

