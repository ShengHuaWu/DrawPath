## Declarative Programming in Swift
Recently, a series of articles --- [Building a declarative animation framework in Swift](https://www.swiftbysundell.com/posts/building-a-declarative-animation-framework-in-swift-part-1) catches my eye. [John](https://twitter.com/johnsundell) points out a problem with implementing the animation in iOS, which is the more steps we add into our animation the more complex and hard to read our code becomes. Therefore, he creates a declarative way to deal with the animation, and it really makes our code more concise and readable. If you haven't read those articles, I highly recommend you should visit it.

### Why Declarative Programming
As developers, not only do we concentrate on implementing workable features, but also attempt to increase the maintenance of our code.
In order to keep the code robust, it is vital to retain a high-level of expressiveness during programming.
It is said that declarative programming can be used to achieve our goal because one of its basic concepts is describing the intentions of developers.
Furthermore, if we write our code with a declarative way, we are going to obtain really great separation of concerns and therefore the testability will be brought.
Overall, declarative programming is a helpful thought and it is worthwhile to give a try.

### Implementation
In this article, I would like to demonstrate a simple example of declarative programming, which can create different shapes within a UIView instance.
Besides, I take the advantage of CAShapeLayer to implement the shapes, such as a rectangle, an oval, a triangle, and a line.

First of all, let's focus on creating rectangles and write an extension of CAShapeLayer as following.
```
extension CAShapeLayer {
  static func rectangle(roundedRect: CGRect, cornorRadius: CGFloat, color: UIColor) -> CAShapeLayer {
        let path = UIBezierPath(roundedRect: roundedRect, cornerRadius: cornorRadius)
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.fillColor = color.cgColor

        return shape
    }
}
```
Secondly, in order to display the rectangle in a UIView instance, it is necessary to write another extension of UIView.
```
extension UIView {
  func draw(_ shapes: CAShapeLayer...) {
        for shape in shapes {
            layer.addSublayer(shape)
        }
    }
}
```
The above draw method takes a variable number of arguments instead of an array.
Consequently, the compiler can automatically construct an array from the arguments, leaving us with a much cleaner syntax.

Then, let's put them together and see the outcome.
```
let containFrame = CGRect(x: 0, y: 0, width: 500, height: 500)
let containView = UIView(frame: containFrame)
containView.backgroundColor = .white

let roundedRect = containFrame.insetBy(dx: 100, dy: 100)
containView.draw(
    .rectangle(roundedRect: roundedRect, cornorRadius: 16, color: .red)
)
```

![RedRectangle](https://github.com/ShengHuaWu/DrawPath/blob/master/Resources/RedRectangle.png)

Now, we are able to create ovals, triangles, and lines with the same pattern. Add the following code into the extension of CAShapeLayer.
```
extension CAShapeLayer {
    // ...

    static func oval(in rect: CGRect, color: UIColor) -> CAShapeLayer {
        let path = UIBezierPath(ovalIn: rect)
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.fillColor = color.cgColor

        return shape
    }

    static func triangle(_ point1: CGPoint, _ point2: CGPoint, _ point3: CGPoint, color: UIColor) -> CAShapeLayer {
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

    static func line(start: CGPoint, end: CGPoint, width: CGFloat, color: UIColor) -> CAShapeLayer {
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
```

Finally, the drawing code will look like this.
```
// ...

containView.draw(
    .rectangle(roundedRect: roundedRect, cornorRadius: 16, color: .red),
    .oval(in: roundedRect.insetBy(dx: 20, dy: 30), color: .blue),
    .triangle(CGPoint(x: 10, y: 10), CGPoint(x: 10, y: 150), CGPoint(x: 150, y: 10), color: .brown),
    .line(start: CGPoint(x: 480, y: 10), end: CGPoint(x: 480, y: 300), width: 6, color: .green)
)

```

### Conclusion
It is indeed a naive example, but I hope it can provide a taste of declarative programming.

As Swift keeps evolving, there are more and more new features that can help to describe developer's intentions during programming.
Hence, it will be more straightforward to adapt declarative programming in Swift.
Needless to say, using this kind of approach has a huge impact on our codebase as well as our productivity.
So, try to think a problem in a declarative way next time!

Any comment and feedback are welcome, so please share your thoughts. Thank you!
