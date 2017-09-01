import UIKit
import PlaygroundSupport

let containFrame = CGRect(x: 0, y: 0, width: 500, height: 500)
let containView = UIView(frame: containFrame)
containView.backgroundColor = .white

let loaderFrame = containFrame.insetBy(dx: 100, dy: 100)
let loader = CircularLoaderView(frame: loaderFrame)
containView.addSubview(loader)

PlaygroundPage.current.liveView = containView
