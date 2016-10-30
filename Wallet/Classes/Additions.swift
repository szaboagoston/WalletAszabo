
/**  The UIView extension defines additional methods used by this library. */
extension UIView {
    
    /**  The generic method returns the receiver’s superview of a specified class, or nil if it has none. */
    open func container<T: UIView>() -> T? {
        
        var view = superview
        
        while view != nil {
            if let view = view as? T {
                return view
            }
            view = view?.superview
        }
        
        return nil
    }
    
}
