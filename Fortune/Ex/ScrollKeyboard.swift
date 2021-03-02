import UIKit

extension UIViewController {
    
    // MARK: - Notification

      /// Notification発行
      func configureObserver() {
          let notification = NotificationCenter.default
          notification.addObserver(self, selector: #selector(keyboardWillShow(_:)),
                                   name: UIResponder.keyboardWillShowNotification, object: nil)
          notification.addObserver(self, selector: #selector(keyboardWillHide(_:)),
                                   name: UIResponder.keyboardWillHideNotification, object: nil)
          print("Notificationを発行")
      }

      /// キーボードが表示時に画面をずらす。
      @objc func keyboardWillShow(_ notification: Notification?) {
          guard let rect = (notification?.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue,
              let duration = notification?.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval else { return }
          UIView.animate(withDuration: duration) {
              let transform = CGAffineTransform(translationX: 0, y: -(rect.size.height))
              self.view.transform = transform
          }
          print("keyboardWillShowを実行")
      }

      /// キーボードが降りたら画面を戻す
      @objc func keyboardWillHide(_ notification: Notification?) {
          guard let duration = notification?.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? TimeInterval else { return }
          UIView.animate(withDuration: duration) {
              self.view.transform = CGAffineTransform.identity
          }
          print("keyboardWillHideを実行")
      }
}
