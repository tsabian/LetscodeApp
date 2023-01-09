import UIKit

var progressView: UICustomProgress? {
    didSet {
        progressView?.color = .systemBlue
        progressView?.progress = 0.0
    }
}
progressView = UICustomProgress(frame: CGRect(x: 0, y: 0, width: 350, height: 20))
for i in 0...100 {
    let progress = CGFloat(Float(i) / 100.0)
    progressView?.progress = progress
    progressView
}
//let timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
//    progressView?.progress += 0.10
//    if let progress = progressView?.progress, progress >= 1.0 {
//        timer.invalidate()
//    } else {
//        progressView
//    }
//    print(progressView?.progress)
//}
