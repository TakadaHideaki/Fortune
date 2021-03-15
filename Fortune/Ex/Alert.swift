import UIKit

protocol alertActionDelegate {
    func signOutAlertaction(vc: UIViewController)
}

extension UIViewController {
    
    
    //Alaert表示のみ
    func alert(title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    func actionAlert(titile: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        
        let okTap = UIAlertAction(title: "OK", style: .default) { (action) in
//            self.dismiss(animated: true, completion: nil)
            var delegate: alertActionDelegate?
            delegate?.signOutAlertaction(vc: self)

        }
        let canselTap = UIAlertAction(title: "キャンセル", style: .cancel) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        alert.addAction(okTap)
        alert.addAction(canselTap)
        self.present(alert, animated: true)

    }

    
    
}
