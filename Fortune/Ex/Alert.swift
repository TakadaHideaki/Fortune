import UIKit

extension UIViewController {
    
    func alert(title: String, msg: String, action: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: action, style: .default))
        self.present(alert, animated: true)
    }
}
