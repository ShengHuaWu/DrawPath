import UIKit
import PlaygroundSupport

let containFrame = CGRect(x: 0, y: 0, width: 500, height: 500)
let containView = UIView(frame: containFrame)
containView.backgroundColor = .white

let roundedRect = containFrame.insetBy(dx: 100, dy: 100)
containView.drawRectangle(roundedRect: roundedRect, cornorRadius: 16, color: .red)
/*
containView.draw(
    .rectangle(roundedRect: roundedRect, cornorRadius: 16, color: .red),
    .oval(in: roundedRect.insetBy(dx: 20, dy: 30), color: .blue),
    .triangle(CGPoint(x: 10, y: 10), CGPoint(x: 10, y: 150), CGPoint(x: 150, y: 10), color: .brown),
    .line(start: CGPoint(x: 480, y: 10), end: CGPoint(x: 480, y: 300), width: 6, color: .green)
)*/

PlaygroundPage.current.liveView = containView
