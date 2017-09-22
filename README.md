# BNSwipeableButton

[![build](https://img.shields.io/badge/build-passing-brightgreen.svg?style=flat)](https://github.com/bennagar/BNSwipeableButton)
[![Swift 3.0](https://img.shields.io/badge/Swift-3.0-orange.svg?style=flat)](https://swift.org/)
[![platform](https://img.shields.io/badge/platform-ios-lightgrey.svg?style=flat)](https://github.com/bennagar/BNSwipeableButton)
[![platform](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://github.com/bennagar/BNSwipeableButton)
[![platform](https://img.shields.io/twitter/follow/codeletter.svg?style=social)](https://twitter.com/codeletter)

BNSwipeableButton is a Swift button that can be swiped to change its state. Created by [Ben Nagar](http://twitter.com/bennagar).

![Animation](Screenshots/BNSlidingView%20demo%20video.gif)

## Requirements

- Xcode 8.2+
- iOS 8.0+

## Installation

Just add BNSwipeableButton.swift to your project.

## Usage

1. Create ```BNSwipeableButton``` instance, with storyboard or just with code

2. On your view controller ```viewDidLoad``` call the ```setup()``` function with a list of colors for the different button pages
``` swift
@IBOutlet var button: BNSwipeableButton!

  override func viewDidLoad() {
      super.viewDidLoad()
      button.setup(colors: [(.blue,.green), (.green,.yellow), (.yellow,.red), (.red,.purple)], delegate: self)
  }
```

3. Confirm to ```BNSwipeableButtonDelegate``` for handling button events
``` swift
  protocol BNSwipeableButtonDelegate: class {
      func buttonDidTap()
      func buttonPageDidChange(to page:Int)
  }
```

## License
BNSwipeableButton is available under the MIT license. See the LICENSE file for more info.

Follow on Twitter [✨CodeLetter ✎ ✨](http://twitter.com/codeletter)  [![platform](https://img.shields.io/twitter/follow/codeletter.svg?style=social)](https://twitter.com/codeletter)
