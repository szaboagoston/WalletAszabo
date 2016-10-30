
/**  The CardView class defines the attributes and behavior of the cards that appear in WalletView objects. */
open class CardView: UIView {
    
    // MARK: Public methods

    /**  A Boolean value that determines whether the view is presented. */
    open var presented: Bool = false
    
    /** This method is called when the card view is tapped. */
    open func tapped() {
        if let _ = walletView?.presentedCardView {
            walletView?.dismissPresentedCardView(animated: true)
        } else {
            walletView?.present(cardView: self, animated: true)
        }
    }
    
    /** This method is called when the card view is panned. */
    open func panned(gestureRecognizer: UIPanGestureRecognizer) {
        
        switch gestureRecognizer.state {
        case .began:
            walletView?.grab(cardView: self, popup: false)
        case .changed:
            updateGrabbedCardViewOffset(gestureRecognizer: gestureRecognizer)
        default:
            walletView?.releaseGrabbedCardView()
        }
        
    }
    
    /** This method is called when the card view is long pressed. */
    open func longPressed(gestureRecognizer: UILongPressGestureRecognizer) {
        
        switch gestureRecognizer.state {
        case .began:
            walletView?.grab(cardView: self, popup: true)
        case .changed: ()
        default:
            walletView?.releaseGrabbedCardView()
        }
        
        
    }
    
    let tapGestureRecognizer    = UITapGestureRecognizer()
    let panGestureRecognizer    = UIPanGestureRecognizer()
    let longGestureRecognizer   = UILongPressGestureRecognizer()
    
    public var walletView: WalletView? {
        return container()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupGestures()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupGestures()
    }
    
    // MARK: Private methods
    
    func setupGestures() {
        
        tapGestureRecognizer.addTarget(self, action: #selector(CardView.tapped))
        tapGestureRecognizer.delegate = self
        addGestureRecognizer(tapGestureRecognizer)
        
        panGestureRecognizer.addTarget(self, action: #selector(CardView.panned(gestureRecognizer:)))
        panGestureRecognizer.delegate = self
        addGestureRecognizer(panGestureRecognizer)
        
        longGestureRecognizer.addTarget(self, action: #selector(CardView.longPressed(gestureRecognizer:)))
        longGestureRecognizer.delegate = self
        addGestureRecognizer(longGestureRecognizer)
        
    }
    
    
    func updateGrabbedCardViewOffset(gestureRecognizer: UIPanGestureRecognizer) {
        let offset = gestureRecognizer.translation(in: walletView).y
        if presented && offset > 0 {
            walletView?.updateGrabbedCardView(offset: offset)
        } else if !presented {
            walletView?.updateGrabbedCardView(offset: offset)
        }
    }
    
}

extension CardView: UIGestureRecognizerDelegate {
    
    open override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        
        if gestureRecognizer == longGestureRecognizer && presented {
            return false
        } else if gestureRecognizer == panGestureRecognizer && !presented && walletView?.grabbedCardView != self {
            return false
        }
        
        return true
        
    }
    
    open func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return gestureRecognizer != tapGestureRecognizer && otherGestureRecognizer != tapGestureRecognizer
    }
    
    
}
