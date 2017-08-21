import UIKit
import PlaygroundSupport

let containFrame = CGRect(x: 0, y: 0, width: 500, height: 500)
let containView = UIView(frame: containFrame)
containView.backgroundColor = .white

let roundedRect = containFrame.insetBy(dx: 100, dy: 100)
containView.draw(
    .rectangle(roundedRect: roundedRect, cornorRadius: 16, color: .red),
    .oval(in: roundedRect.insetBy(dx: 20, dy: 30), color: .blue)
)

PlaygroundPage.current.liveView = containView
