[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/posix88/FasterVerificationCode/master/LICENSE)
[![SPM](https://img.shields.io/badge/spm-compatible-brightgreen.svg?style=flat)](https://github.com/apple/swift-package-manager)
[![@Ninomusolino](https://img.shields.io/badge/contact-@Ninomusolino-blue.svg?style=flat)](https://twitter.com/Ninomusolino)

<p align="center">
<img src="https://raw.githubusercontent.com/posix88/CodeVerifier/master/CodeVerifier.gif" alt="Icon"/>
</p>

# CodeVerifier 

An high customizable and fast verification code view, written in SwiftUI.

`CodeVerifier` is an open-source fully customizable `input view`  built to makes easier and faster the input of a verification code you provided to your users via mail/phone. 

## System Requirements
iOS 13.0 or above

## Features
✅ Embed a Textfield with semantic intent .oneTimeCode 
✅ Full customizable style
✅ Keyboard aware

## Next Step
⚠️ Dark Mode support

## Installation

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into `Xcode`.

Once you have your Swift package set up, adding FasterVerificationCode as a dependency is very easy. You've just to add it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/posix88/CodeVerifier")
    ]
```
or you can simply go to File -> Swift Packages -> Add Package Dependency and paste the repo's url: https://github.com/posix88/CodeVerifier

## Examples
Using `CodeVerifier` is very easy and straightforward. Just create it inside your `body`passing as argument the code to be inserted by the user.

You can customize the appearance of the code verifier during initialization using its modifier and the `SecureCodeStyle` class.
 
### Basic Implementation

```swift
  var body: some View {
        SecureCodeVerifier(code: *your code*)
            .onCodeFilled { isCodeCorrect in
                
            }.withStyle(Styles.defaultStyle)
    }
```

### Customization

You can create your own style creating a new `defaultStyle`

```swift
  var myStyle: SecureCodeStyle {
        SecureCodeStyle(lineWidth: 20, lineHeight: 2, normalLineColor: .black, errorLineColor: .red, labelWidth: 20, labelHeight: 30, labelSpacing: 15, normalTextColor: .black, errorTextColor: .black, carrierHeight: 30, carrierSpacing: 5, carrierColor: .black)
    }
```

DarkMode will be supported in the future. 

## Contributing

- If you **need help** or you'd like to **ask a general question**, open an issue.
- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.


## Acknowledgements

Made with ❤️ in Milan by [Antonino Musolino](https://twitter.com/NinoMusolino).

`CodeVerifier` is a SwiftUI porting of [`FasterVerificationCode`](https://github.com/posix88/FasterVerificationCode)
