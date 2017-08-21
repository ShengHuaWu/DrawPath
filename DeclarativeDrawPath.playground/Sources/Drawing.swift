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
    
    public static func oval(in rect: CGRect, color: UIColor) -> CAShapeLayer {
        let path = UIBezierPath(ovalIn: rect)
        let layer = CAShapeLayer()
        layer.path = path.cgPath
        layer.fillColor = color.cgColor
        
        return layer
    }
    
    public static func triangle(_ point1: CGPoint, _ point2: CGPoint, _ point3: CGPoint, color: UIColor) -> CAShapeLayer {
        let path = UIBezierPath()
        path.move(to: point1)
        path.addLine(to: point2)
        path.addLine(to: point3)
        path.close()
        
        let layer = CAShapeLayer()
        layer.path = path.cgPath
        layer.fillColor = color.cgColor
        
        return layer
    }
    
    public static func line(start: CGPoint, end: CGPoint, width: CGFloat, color: UIColor) -> CAShapeLayer {
        let path = UIBezierPath()
        path.move(to: start)
        path.addLine(to: end)
        
        let layer = CAShapeLayer()
        layer.path = path.cgPath
        layer.lineWidth = width
        layer.strokeColor = color.cgColor
        
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
