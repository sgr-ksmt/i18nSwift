# i18nSwift

i18n for Swift.  
<br />

[![Build Status](https://travis-ci.org/sgr-ksmt/i18nSwift.svg?branch=master)](https://travis-ci.org/sgr-ksmt/i18nSwift)
[![GitHub release](https://img.shields.io/github/release/sgr-ksmt/i18nSwift.svg)](https://github.com/sgr-ksmt/i18nSwift/releases)
![Language](https://img.shields.io/badge/language-Swift%203-orange.svg)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![CocoaPods](https://img.shields.io/badge/Cocoa%20Pods-✓-4BC51D.svg?style=flat)](https://cocoapods.org/pods/i18nSwift)
[![CocoaPodsDL](https://img.shields.io/cocoapods/dt/i18nSwift.svg)](https://cocoapods.org/pods/i18nSwift)
[![codecov](https://codecov.io/gh/sgr-ksmt/i18nSwift/branch/master/graph/badge.svg)](https://codecov.io/gh/sgr-ksmt/i18nSwift)


```swift
"order_view_title" = "Order"
"order_view_button" = "Order (price: %@)"
==========================

// "Order"
titleLabel.text = NSLocalizedString("order_view_title", comment: "")
// "Order (price: USD100.00)"
let price = "$100.00"
let buttonTitle = String(format: NSLocalizedString("order_view_button", comment: ""), arguments: price)
orderButton.setTitle(buttonTitle, for: .normal)


⬇️⬇️⬇️

// "Order"
titleLabel.text = i18n.t(.orderViewTitle)
// "Order (price: USD100.00)"
orderButton.setTitle(i18n.t(.orderViewButton, args: i18n.currencyISO(100)), for: .normal)
```


## Features

- Swifty handling
- Localization
  - **Safety**,
  - **Static typing**
  - Change language without switching system language setting.
- Currency (convert number into currency using locale)
- Tested perfectly.

### TODO
- [ ] Number
- [ ] Date
- [ ] Pluralization

## Requirements
- Swift 3.x
- Xcode 8.x
- iOS 9.0 or later

## Usage

### Localization

- **Create `Localizable.strings`**

```swift
"hello_world" = "Hello, world!";
"total_count" = "Total: %d";
```

Add `Localizable.strings` in your project and define keys and values.

- **Define `LocalizedString`**

```swift
extension i18n.LocalizedString {
    static let helloWorld: i18n.LocalizedString = "hello_world"
    static let totalCount: i18n.LocalizedString = "total_count"
    // or
    static let helloWorld = i18n.LocalizedString(rawValue: "hello_world")
}
```

Add `LocalizedString`'s static variable as extension of `i18n.LocalizedString`.  
It's similar to `Notification.Name`. :heart:

```swift
extension Notification.Name {
    static let fooDidUpdate = Notification.Name(rawValue: "FooDidUpdate")
}
```


- **localize with `i18n`**

```swift
let message = i18n.t(.helloWorld)
print(message) // "Hello, world!

// localize and embed paramter(s)
let total = i18n.t(.totalCount, args: 100)
print(total) // "Total: 100"
```

**Tips** Add `args:` label and parameter(s) if you can embed arguments in localized string.

## Language
**i18nSwift** equips function of changing the language in appllication.  
If you change the language, result of localization will change.

```swift
// en
"greeting" = "Hello!";
// fr
"greeting" = "Bonjour!";
```

```swift
// system language is "en"
print(i18n.t(.greeting)) // "Hello!"

// Change language to "fr"
i18n.Language.current = "fr"
print(i18n.t(.greeting)) // "Bonjour!"

// ===================
// Reboot application!!
// ===================

// `Language.current` is being stored.
print(i18n.t(.greeting)) // "Bonjour!"

// Reset to system language
i18n.Language.reset()

// change temporary in localization
print(i18n.t(.greeting, "fr")) // "Bonjour!"
```

**Tips** : `i18n.Language.current` is saved in UserDefaults using `i18n.Language.Constant.currentLanguageKey`

### Currency
**i18nSwift** converts number into localized currency.

```swift
// default is `Locale.current`

print(i18n.currency(100)) // $100.00
print(i18n.currency(100, Locale(identifier: "ja_JP"))) // ¥100
print(i18n.currency(100, fractionDigits: (4, 4))) // $100.0000
print(i18n.currencyISO(100)) // USD100.00
```

## Installation

### Carthage

- Add the following to your *Cartfile*:

```bash
github "sgr-ksmt/i18nSwift" ~> 0.3
```

- Run `carthage update`
- Add the framework as described.
<br> Details: [Carthage Readme](https://github.com/Carthage/Carthage#adding-frameworks-to-an-application)


### CocoaPods

**i18nSwift** is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'i18nSwift', '~> 0.3'
```

and run `pod install`

### Manually Install
Download all `*.swift` files and put your project.

## Change log
Change log is [here](https://github.com/sgr-ksmt/i18nSwift/blob/master/CHANGELOG.md).

## Communication
- If you found a bug, open an issue.
- If you have a feature request, open an issue.
- If you want to contribute, submit a pull request.:muscle:

## License

**i18nSwift** is under MIT license. See the [LICENSE](LICENSE) file for more info.
