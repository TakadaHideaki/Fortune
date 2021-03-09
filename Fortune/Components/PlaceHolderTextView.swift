import UIKit

class PlaceHolderTextView: UITextView {
    
    // MARK: - プロパティ
    /// プレースホルダーに表示する文字列（ローカライズ付き）
    @IBInspectable var placeHolder: String = "" {
        willSet {
            self.placeholderLabel.text = newValue
            self.placeholderLabel.sizeToFit()
        }
    }

    /// プレースホルダー用ラベルを作成
    private lazy var placeholderLabel = UILabel(frame: CGRect(x: 6, y: 6, width: 0, height: 0))

    // MARK: - Viewライフサイクルメソッド
    /// ロード後に呼ばれる
    override func awakeFromNib() {
        super.awakeFromNib()
        delegate = self
        configurePlaceholder()
        togglePlaceholder()
    }
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        delegate = self
        configurePlaceholder()
        togglePlaceholder()
        
    }

    /// プレースホルダーを設定する
    private func configurePlaceholder() {
        placeholderLabel.textColor = .lightGray
        self.addSubview(placeholderLabel)
    }

    /// プレースホルダーの表示・非表示切り替え
    private func togglePlaceholder() {
        // テキスト未入力の場合のみプレースホルダーを表示する
        placeholderLabel.isHidden = text.isEmpty ? false : true
    }
}

// MARK: -  UITextView Delegate
extension PlaceHolderTextView: UITextViewDelegate {
    /// テキストが書き換えられるたびに呼ばれる ※privateにはできない
    func textViewDidChange(_ textView: UITextView) {
        togglePlaceholder()
    }
}




