# CodeVerifier

An high customizable and fast verification code view, written in SwiftUI.

`CodeVerifier` is an open-source fully customizable `input view`  built to makes easier and faster the input of a verification code you provided to your users via mail/phone. 

## System Requirements
iOS 13.0 or above

## Installation

// Will be shipped soon

## Examples
Using `CodeVerifier` is very easy and straightforward. Just create it inside your `body`passing as argument the code to be inserted by the user.

You can customize the appearance of the code verifier during initialization. 

### Basic Implementation

```swift
  var body: some View {
        SecureCodeVerifier(code: *your code*)
            .onCodeFilled { isCodeCorrect in
                
            }
    }
```

## Contributing

- If you **need help** or you'd like to **ask a general question**, open an issue.
- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.


## Acknowledgements

Made with ❤️ in Milan by [Antonino Musolino](https://twitter.com/NinoMusolino).

`CodeVerifier` is a SwiftUI porting of [`FasterVerificationCode`](https://github.com/posix88/FasterVerificationCode)
