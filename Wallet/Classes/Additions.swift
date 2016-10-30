
extension UIView {
    
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
