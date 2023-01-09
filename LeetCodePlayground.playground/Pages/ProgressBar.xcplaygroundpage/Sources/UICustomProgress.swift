/*
Font: https://medium.com/@marina.sauca/custom-progress-bars-dc1c1c111751
 */

import UIKit

public class UICustomProgress: UIView {
    
    @IBInspectable
    public var color: UIColor? = .gray
    
    @IBInspectable
    public var progress: CGFloat = 1 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    public override func draw(_ rect: CGRect) {
        let bgMask = CAShapeLayer()
        bgMask.path = UIBezierPath(roundedRect: rect, cornerRadius: rect.height * 0.25).cgPath
        layer.mask = bgMask
        
        let progressLayer = CALayer()
        progressLayer.frame = CGRect(origin: .zero,
                                     size: CGSize(width: rect.width * progress,
                                                  height: rect.height))
        layer.addSublayer(progressLayer)
        progressLayer.backgroundColor = color?.cgColor
        
    }
}
