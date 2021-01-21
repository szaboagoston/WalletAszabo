# Wallet

[![Platform](https://img.shields.io/cocoapods/p/Wallet.svg?style=flat)](http://cocoadocs.org/docsets/Wallet)
[![License](https://img.shields.io/cocoapods/l/Wallet.svg?style=flat)](http://cocoadocs.org/docsets/Wallet)

Wallet is a replica of the Apple's Wallet interface. Add, delete or present your cards and passes.

Feel free to use this pod in your project and add any other functionality to the Wallet.

Please, contribute and send pull requests!

## Requirements

- iOS 11.0+
- Swift 5

## Apps using Wallet

[Recipe Scaler](https://apps.apple.com/tt/app/id1483478067)

*Send a PR to add your app here*

## Preview
![Wallet](https://github.com/rshevchuk/Wallet/blob/master/preview.gif?raw=true)

## Example

To run the example application use `pod try`:

In a terminal, simply execute:

```bash
$ pod try Wallet
```

and run the target named `Wallet-Example` in Xcode.

## Getting Started

- **[CocoaPods](https://cocoapods.org)**

    - Add the following lines to your Podfile:
    
      ```ruby
      pod 'Wallet'
      ```
    - Run `pod install`
    - You are all set!
  
- **[Carthage](https://github.com/carthage/carthage)**

    - Add the following line to your Cartfile:
      ```
      github "rshevchuk/Wallet"
      ```

    - Run `carthage update`.  
    - On your application targets' `General` settings tab, in the `Linked Frameworks and Libraries` section:
        - Drag & drop the following frameworks from `Carthage/Build` folder on disk:
    - On your application targets' `Build Phases` tab:
        - Click `+` icon and choose `New Run Script Phase`.
        - Create a script with a shell of your choice (e.g. `/bin/sh`).
        - Add the following to the script area below the shell:
          ```
          /usr/local/bin/carthage copy-frameworks
          ```

        - Add the paths to the frameworks you want to use under `Input Files`, for example:
        
          ```
          $(SRCROOT)/Carthage/Build/iOS/Wallet.framework
          ```

## Documentation

Documentation for Wallet can be found on [CocoaDocs.org](http://cocoadocs.org/docsets/Wallet/).

## License

Wallet is available under the MIT license. See the LICENSE file for more info.
