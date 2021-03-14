
import UIKit

class CustomNavigationBar: UINavigationBar {
    // NavigationBar の高さ
    private let barHeight: CGFloat = 100

    // イニシャライザ
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.commonInit()
    }

    // 必須イニシャライザ
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func commonInit() {
        // NavigationBar の色
        self.barTintColor = .white
    }

    // 1. 指定されたサイズに最適なサイズを計算して返すようにビューに要求
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var newSize = super.sizeThatFits(size)
        var topInset: CGFloat = 0.0

        // iPhone X 以降 (SafeArea の高さを取得)
        if #available(iOS 11.0, *) {
            topInset = superview?.safeAreaInsets.top ?? 0
        }

        // NavigationBar の高さを設定
        newSize.height = barHeight + topInset

        return newSize
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        if #available(iOS 11.0, *) {
            for subview in subviews {
                let stringFromClass = NSStringFromClass(subview.classForCoder)

                // NavigationBar の高さを調整
                if stringFromClass.contains("UIBarBackground") {
                    let topInset: CGFloat = superview?.safeAreaInsets.top ?? 0
                    subview.frame = CGRect(origin: CGPoint(x: 0, y: -topInset), size: sizeThatFits(self.bounds.size))
                }

                // UINavigationBarContentView の位置を調整
                if stringFromClass.contains("UINavigationBarContentView") {
                    let y = (barHeight - subview.frame.height)
                    subview.frame.origin.y = y
                }
            }
        }
    }
}
