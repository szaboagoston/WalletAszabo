# Wallet

Wallet is a replica of Apple's Wallet. Add, delete or present your cardViews and passes just like in Wallet.

Feel free to use this pod in your project and add any other functionality to the Wallet. Please, contribute and send pull requests!

## Requirements

- iOS 8.0+
- Swift 3

## Installation

Wallet is available as CocoaPod.

## Preview
![Wallet](https://github.com/rshevchuk/Wallet/blob/master/preview.gif?raw=true)

## Documentation

### Wallet API
```swift

open class WalletView : UIView {

      /**
       Reloads wallet view with card views.

       - parameter cardViews: Card views to be inserted to the wallet view.
       */
      open func reload(cardViews: [Wallet.CardView])

      /**
       Presents a card view.

       - parameter cardView: A card view to be presented.
       - parameter animated: If true, the view is being added to the wallet view using an animation.
       - parameter completion: A block object to be executed when the animation sequence ends.
       */
      open func present(cardView: Wallet.CardView, animated: Bool, completion: Wallet.WalletView.LayoutCompletion? = default)

      /**
       Dismisses the card view that was presented by the wallet view.

       - parameter animated: If true, the view is being removed from the wallet view using an animation.
       - parameter completion: A block object to be executed when the animation sequence ends.
       */
      open func dismissPresentedCardView(animated: Bool, completion: Wallet.WalletView.LayoutCompletion? = default)

      /**
           Inserts a card view to the beginning of the receiver’s list of card views.

           - parameter cardView: A card view to be inserted.
           - parameter animated: If true, the view is being added to the wallet view using an animation.
           - parameter presented: If true, the view is being added to the wallet view and presented right way.
           - parameter completion: A block object to be executed when the animation sequence ends.

           */
      open func insert(cardView: Wallet.CardView, animated: Bool = default, presented: Bool = default, completion: Wallet.WalletView.InsertionCompletion? = default)

      /**
       Removes the specified card view from the wallet view.

       - parameter cardView: A card view to be removed.
       - parameter animated: If true, the view is being remove from the wallet view using an animation.
       - parameter completion: A block object to be executed when the animation sequence ends.

       */
      open func remove(cardView: Wallet.CardView, animated: Bool = default, completion: Wallet.WalletView.RemovalCompletion? = default)

      /**
       Removes the specified card views from the wallet view.

       - parameter cardViews: Card view to be removed.

       */
      open func remove(cardViews: [Wallet.CardView])

    /**
     The desirable card view height value. Used when wallet view has enough space.
     */
    public var preferableCardViewHeight: CGFloat

    /**
     Number of card views to show in the bottom of the wallet view when presenting card view.
     */
    public var maximimNumberOfCollapsedCardViewsToShow: Int

    /**
     The positioning of card views relative to each other when the wallet view is not presenting card view.
     */
    public var minimalDistanceBetweenStackedCardViews: CGFloat

    /**
     The positioning of card views relative to each other when the wallet view is presenting card view.
     */
    public var minimalDistanceBetweenCollapsedCardViews: CGFloat

    /**
     The positioning of card views relative to receiver’s presenting card view.
     */
    public var distanceBetweetCollapsedAndPresentedCardViews: CGFloat

    /**
     The pop up offset of a card view when a long tap detected.
     */
    public var grabPopupOffset: CGFloat

    /**
     The total duration of the animations when the card view is being presented.
     */
    public static var presentingAnimationSpeed: TimeInterval

    /**
     The total duration of the animations when the card view is being dismissed.
     */
    public static var dismissingAnimationSpeed: TimeInterval

    /**
     The total duration of the animations when the card view is being insertred.
     */
    public static var insertionAnimationSpeed: TimeInterval

    /**
     The total duration of the animations when the card view is being removed.
     */
    public static var removalAnimationSpeed: TimeInterval

    /**
     The total duration of the animations when the card view is being grabbed.
     */
    public static var grabbingAnimationSpeed: TimeInterval

    /**
     This block is called after the receiver’s card view is presented or dimissed.
     */
    public var didUpdatePresentedCardViewBlock: Wallet.WalletView.PresentedCardViewDidUpdateBlock?

    /**
     Returns an accessory view that is displayed above the wallet view.
     */
    @IBOutlet weak public var walletHeader: UIView?

    /**
     The card view that is presented by this wallet view.
     */
    public var presentedCardView: Wallet.CardView?

    /**
     The receiver’s immediate card views.
     */
    public var insertedCardViews: [Wallet.CardView]

    /**
     The distance that the wallet view is inset from the enclosing scroll view.
     */
    public var contentInset: UIEdgeInsets

}

open class CardView : UIView {

    /**
     A Boolean value that determines whether the view is presented.
     */
    open var presented: Bool

    /**
     This method is called when the card view is tapped.
     */
    open func tapped()

    /**
     This method is called when the card view is panned.
     */
    open func panned(gestureRecognizer: UIPanGestureRecognizer)

    /**
     This method is called when the card view is long pressed.
     */
    open func longPressed(gestureRecognizer: UILongPressGestureRecognizer)

}

```

## License

Wallet is available under the MIT license. See the LICENSE file for more info.
