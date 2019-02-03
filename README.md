# EmptyStateView

This is a pod helpful for polite app.

![img](https://i.imgur.com/OULasya.png)

## Usage

### Basics

#### Init View
```swift
let emptyView = EmptyStateView(image: UIImage(named: "Your image name")!, title: "Opss...", message: "Something went wrong!", buttonText: "Try again")
```
Then you can add to `view` in your controller

```swift
view.addSubview(emptyView)
emptyView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
emptyView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
emptyView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
emptyView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
```

#### Design view on your own

You can change whatever you want, for example backgroundColor of `button` or `radius`

```swift
emptyView.button.backgroundColor = UIColor.red
emptyView.button.layer.cornerRadius = 8
```

### Installation

#### CocoaPods

EmptyStateView is available through CocoaPods. To install it, simply add the following line to your Podfile:

`pod 'EmptyStateView'`

### Author

David Kadlček, da.developer605@gmail.com

### License

MIT
