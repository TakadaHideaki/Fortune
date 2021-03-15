import Foundation
import MessageUI

enum SenMailResult<T: UIViewController> {
    case success(T), failure
}

struct Mail {
    
    func sendMail(handler: @escaping (SenMailResult< MFMailComposeViewController>) -> Void) {

        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            //mail.mailComposeDelegate = self //as? MFMailComposeViewControllerDelegate
            mail.setToRecipients(["cychaincontact@gmail.com"])
            mail.setSubject("お問い合わせ")
            mail.setMessageBody("お問い合わせ内容", isHTML: false)
            handler(.success(mail))
        } else {
            handler(.failure)
        }
    }
      
}


