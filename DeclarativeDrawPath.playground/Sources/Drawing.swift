import Foundation
import UIKit

extension CAShapeLayer {
    public static func rectangle(roundedRect: CGRect, cornorRadius: CGFloat, color: UIColor) -> CAShapeLayer {
        let path = UIBezierPath(roundedRect: roundedRect, cornerRadius: cornorRadius)
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.fillColor = color.cgColor
        
        return shape
    }
    
    public static func oval(in rect: CGRect, color: UIColor) -> CAShapeLayer {
        let path = UIBezierPath(ovalIn: rect)
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.fillColor = color.cgColor
        
        return shape
    }
    
    public static func triangle(_ point1: CGPoint, _ point2: CGPoint, _ point3: CGPoint, color: UIColor) -> CAShapeLayer {
        let path = UIBezierPath()
        path.move(to: point1)
        path.addLine(to: point2)
        path.addLine(to: point3)
        path.close()
        
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.fillColor = color.cgColor
        
        return shape
    }
    
    public static func line(start: CGPoint, end: CGPoint, width: CGFloat, color: UIColor) -> CAShapeLayer {
        let path = UIBezierPath()
        path.move(to: start)
        path.addLine(to: end)
        
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.lineWidth = width
        shape.strokeColor = color.cgColor
        
        return shape
    }
}

extension UIView {
    public func draw(_ shapes: CAShapeLayer...) {
        for shape in shapes {
            layer.addSublayer(shape)
        }
    }
    
    public func drawRectangle(roundedRect: CGRect, cornorRadius: CGFloat, color: UIColor) {
        let path = UIBezierPath(roundedRect: roundedRect, cornerRadius: cornorRadius)
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.fillColor = color.cgColor
        
        layer.addSublayer(shape)
    }
    
    public func drawOval(in rect: CGRect, color: UIColor) {
        let path = UIBezierPath(ovalIn: rect)
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.fillColor = color.cgColor
        
        layer.addSublayer(shape)
    }
    
    public func drawTriangle(_ point1: CGPoint, _ point2: CGPoint, _ point3: CGPoint, color: UIColor) {
        let path = UIBezierPath()
        path.move(to: point1)
        path.addLine(to: point2)
        path.addLine(to: point3)
        path.close()
        
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.fillColor = color.cgColor
        
        layer.addSublayer(shape)
    }
    
    public func drawLine(start: CGPoint, end: CGPoint, width: CGFloat, color: UIColor) {
        let path = UIBezierPath()
        path.move(to: start)
        path.addLine(to: end)
        
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.lineWidth = width
        shape.strokeColor = color.cgColor
        
        layer.addSublayer(shape)
    }
}
