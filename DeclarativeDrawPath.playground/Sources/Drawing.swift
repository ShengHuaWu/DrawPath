import Foundation
import UIKit

extension CAShapeLayer {
    public static func rectangle(roundedRect: CGRect, cornorRadius: CGFloat, color: UIColor) -> CAShapeLayer {
        let path = UIBezierPath(roundedRect: roundedRect, cornerRadius: cornorRadius)
        let layer = CAShapeLayer()
        layer.path = path.cgPath
        layer.fillColor = color.cgColor
        
        return layer
    }
}

extension UIView {
    public func draw(_ shapes: CAShapeLayer...) {
        for shape in shapes {
            layer.addSublayer(shape)
        }
    }
}
